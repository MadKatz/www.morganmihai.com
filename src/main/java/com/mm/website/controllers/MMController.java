package com.mm.website.controllers;

import com.mm.website.model.PasswordUpdate;
import com.mm.website.model.User;
import com.mm.website.model.UserRole;
import com.mm.website.service.UserRoleService;
import com.mm.website.service.UserService;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AnonymousAuthenticationToken;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.validation.BindingResult;

@Controller
public class MMController {

    private static final Logger LOGGER = LoggerFactory.getLogger(MMController.class);
    private static final String ADMIN_ROLE = "ROLE_ADMIN";
    
    private UserService userService;
    private UserRoleService userRoleService;
    private BCryptPasswordEncoder passwordencoder;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService us) {
        this.userService = us;
    }
    
    @Autowired(required = true)
    @Qualifier(value = "userRoleService")
    public void setUserService(UserRoleService userRoleService) {
        this.userRoleService = userRoleService;
    }

    @Autowired(required = true)
    @Qualifier(value = "encoder")
    public void setEncoder(BCryptPasswordEncoder encoder) {
        this.passwordencoder = encoder;
    }

    @RequestMapping(value = {"/", "/index", "/home"})
    public String indexPage(ModelMap model) {
        return "index";
    }

    @RequestMapping(value = "/projects")
    public String projectsPage(ModelMap model) {
        return "projects";
    }

    @RequestMapping(value = "/resume")
    public String resumePage(ModelMap model) {
        return "resume";
    }
    
    @RequestMapping(value = "/admin")
    public String adminPage(ModelMap model) {
        final List<User> users = userService.listUsers();
        final List<UserRole> userRoles = userRoleService.listUserRoles();
        final Map<User, String> usersWithRoleMap = 
                generateUsersWithRoleMap(users, userRoles);
        final SortedMap<User, String> sortedUsersWithRoleMap =
                new TreeMap<User, String>();
        
        sortedUsersWithRoleMap.putAll(usersWithRoleMap);
        model.addAttribute("usersMap", sortedUsersWithRoleMap);
        model.addAttribute("user", new User());
        return "admin";
    }
    
    private Map<User, String> generateUsersWithRoleMap(final List<User> users,
            final List<UserRole> userRoles) {
        final Map<User, String> usersWithRoleMap = new HashMap<User, String>();
        final int usersSize = users.size();
        
        for (int i = 0; i < usersSize; i++) {
            final User user = users.get(i);
            String userRole = "NULL";
            for (UserRole role : userRoles) {
                if (role.getUserId() == user.getUserId()) {
                    userRole = role.getRole();
                    break;
                }
            }
            usersWithRoleMap.put(user, userRole);
        }
        return usersWithRoleMap;
    }
    
    @RequestMapping(value = "/admin/disable", method = RequestMethod.POST)
    public String adminDisableAction(@Valid @ModelAttribute("user") User user,
            BindingResult result, ModelMap model) {
        final List<String> roles = getRoles();
        updateUserStatus(roles, user, false);
        return "redirect:/admin";
    }
    
    @RequestMapping(value = "/admin/enable", method = RequestMethod.POST)
    public String adminEnableAction(@Valid @ModelAttribute("user") User user,
            BindingResult result, ModelMap model) {
        final List<String> roles = getRoles();
        updateUserStatus(roles, user, true);
        return "redirect:/admin";
    }
    
    private void updateUserStatus(final List<String> roles, final User user,
            final boolean enabled) {
        if (isAdmin(roles)) {
            LOGGER.info("UpdateUserStatus action granted, user: {}.", getPrincipal());
            final User dbUser = userService.getUserByUsername(user.getUsername());
            dbUser.setEnabled(enabled);
            userService.updateUser(dbUser);
        } else {
            LOGGER.info("UpdateUserStatusAction denied, user: {}.", getPrincipal());
            //TODO: add denied redirect.
        }
    }
    
    private boolean isAdmin(final List<String> roles) {
        for (String role : roles) {
            if (role.equals(ADMIN_ROLE)) {
                return true;
            }
        }
        return false;
    }
    
    @RequestMapping(value = "/userhome")
    public String userhomePage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "userhome";
    }

    @RequestMapping(value = {"/userprofile", "/userprofile?success" })
    public String userProfilePage(ModelMap model) {
        final String username = getPrincipal();
        final User user = userService.getUserByUsername(username);
        model.addAttribute("user", user);
        return "userprofile";
    }
    
    @RequestMapping(value = "/userprofile/update", method = RequestMethod.POST)
    public String userProfileUpdateAction(@Valid @ModelAttribute("user") User user,
            BindingResult result, ModelMap model) {
        final String username = getPrincipal();
        final User userFromDB = userService.getUserByUsername(username);
        
        if (isStringValid(user.getFirstName()) && isStringValid(user.getLastName())) {
            if (user.getFirstName().equalsIgnoreCase(userFromDB.getFirstName())
                    && user.getLastName().equalsIgnoreCase(userFromDB.getLastName())) {
                LOGGER.debug("Didnt update user={} due to no change detected.", userFromDB.getUsername());
            } else {
                //Update user
                userFromDB.setFirstName(user.getFirstName());
                userFromDB.setLastName(user.getLastName());
                userService.updateUser(userFromDB);
            }
        } else {  //Invalid String
            return "redirect:/userprofile?invalidString";
        }
        model.addAttribute("user", userFromDB);
        return "redirect:/userprofile?success";
    }
    
    @RequestMapping(value = {"/userprofile/pwdupdate", "/userprofile/pwdupdate?denied"}, method = RequestMethod.GET)
    public String pwdUpdatePage(ModelMap model) {
        model.addAttribute("passwordUpdate", new PasswordUpdate());
        return "pwdupdate";
    }
    
    @RequestMapping(value = "/userprofile/pwdupdate", method = RequestMethod.POST)
    public String pwdUpdateAction(@Valid @ModelAttribute("passwordUpdate") PasswordUpdate passwordUpdate,
            BindingResult result, ModelMap model) {
        if (!isPasswordUpdateValid(passwordUpdate)) {
            return "redirect:/userprofile/pwdupdate?invalidString";
        }
        final String username = getPrincipal();
        final User user = userService.getUserByUsername(username);
        if (!passwordencoder.matches(passwordUpdate.getOldPassword(), user.getPassword())) {
            LOGGER.info("Access denied: {} failed to change password. Incorrect password.", username);
            return "redirect:/userprofile/pwdupdate?denied";
        }
        final String encryptedPassword = passwordencoder.encode(passwordUpdate.getNewPassword());
        user.setPassword(encryptedPassword);
        userService.updateUser(user);
        return "redirect:/userprofile?pwdsuccess";
    }
    
    private boolean isPasswordUpdateValid(PasswordUpdate passwordUpdate) {
        if (isStringValid(passwordUpdate.getNewPassword())
                && isStringValid(passwordUpdate.getOldPassword())) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = {"/signup", "/signup?emailf", "/signup?usernamef", "/signup?validationError"})
    public String signupPage(ModelMap model) {
        model.addAttribute("user", new User());
        return "signup";
    }

    @RequestMapping(value = "/signup/register", method = RequestMethod.POST)
    public String registerAction(@Valid @ModelAttribute("user") User user,
            BindingResult result, ModelMap model) {
        //check make sure values are not null & not empty
        if (!isValidUser(user)) {
            return "redirect:/signup?validationError";
        }
        //check if username or email exists in db.
        final List<User> users = userService.listUsers();
        for (User entry : users) {
            final boolean emailMatch = entry.getEmail().equalsIgnoreCase(user.getEmail());
            final boolean usernameMatch = entry.getUsername().equalsIgnoreCase(user.getUsername());
            if (emailMatch) {
                return "redirect:/signup?emailf";
            }
            if (usernameMatch) {
                return "redirect:/signup?usernamef";
            }
        }
        
        final String encryptedPassword = passwordencoder.encode(user.getPassword());
        user.setPassword(encryptedPassword);
        userService.addUser(user);
        
        final User userWithId = userService.getUserByEmail(user.getEmail());
        if (userWithId == null) {
            LOGGER.error("userWithId is null. Did not get user by email");
            return "redirect:/signup?NoUserByEmailError";
        }
        
        registerUserRole(userWithId.getUserId());
        return "redirect:/signup?success";
    }
    
    // Returns true if user is valid
    private boolean isValidUser(User user) {
        //Email check
        if (!isStringValid(user.getEmail())) {
            return false;
        }
        //Username check
        if (!isStringValid(user.getUsername())) {
            return false;
        }
        //Firstname check
        if (!isStringValid(user.getFirstName())) {
            return false;
        }
        //Lastname check
        if (!isStringValid(user.getLastName())) {
            return false;
        }
        //Password check
        if (!isStringValid(user.getPassword())) {
            return false;
        }
        return true;
    }
    
    private boolean isStringValid(final String str) {
        if (str != null && !str.isEmpty()) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = {"/signin", "/signin?logout"}, method = RequestMethod.GET)
    public String loginPage() {
        final Authentication auth
                = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            return "redirect:/userhome";
        }
        return "signin";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        final Authentication auth
                = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/signin?logout";
    }

    private String getPrincipal() {
        String userName = null;
        final Object principal
                = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
    
    private List<String> getRoles() {
        final Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        final List<String> roles = new ArrayList<String>();
        final Iterator<? extends GrantedAuthority> iterator = authorities.iterator();
        while (iterator.hasNext()) {
            roles.add(iterator.next().getAuthority());
        }
        return roles;
    }
    
    private void registerUserRole(final int userId) {
        final UserRole userRole = new UserRole();
        userRole.setUserId(userId);
        userRole.setRole("ROLE_USER");
        userRoleService.addUserRole(userRole);
    }
}
