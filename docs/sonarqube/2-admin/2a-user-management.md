# User Management

User management in SonarQube allows administrators to manage and configure 
the access levels of users, groups, and roles within the SonarQube platform.
Effective user management ensures that the right people have the 
appropriate access to projects, issues, and configurations, helping 
maintain security and control over the development process.    

## 1. Users

Users in SonarQube represent individual people who have access to the 
system. Users can be created either manually or via integration with 
external authentication systems (e.g., LDAP, SSO).  

- **Admin Users**: Typically have full access to all features and 
  administrative functions. 
- **Regular Users**: Can access and analyze projects, view issues, and 
  contribute to quality analysis, but may have limited access to system 
  configuration settings.  
- **Guest Users**: Typically have read-only access to the system and its data.

## 2. Groups

Groups in SonarQube are used to organize users into sets, often based on 
their roles in the development process. By creating groups, administrators 
can easily manage permissions for multiple users at once.  

- **Default Groups**: SonarQube provides default groups such as 
  `sonar-users` (for regular users) and `sonar-administrators` (for admin 
  users). 
- **Custom Groups**: Custom groups can be created to manage specific teams 
  (e.g., frontend developers, backend developers, security experts) 
  and their access levels. 

## 3. Roles and Permissions

Roles define what actions users and groups can perform within SonarQube. 
Permissions can be granted at both the global and project levels. 

- **Global Permissions**: These include administrative privileges such as 
  managing global configurations, managing users, and configuring system-wide 
  settings.  
- **Project Permissions**: These include permissions specific to individual 
  projects, such as viewing project dashboards, managing project 
  configurations, and running analyses.  

## 4. Authentication and Authorization

SonarQube supports both **internal authentication** (where user accounts 
are stored within SonarQube itself) and **external authentication** (via 
integrations such as LDAP, Active Directory, or SSO). External 
authentication helps centralize user management, especially in larger 
organizations.    

## 5. User and Group Management Interface

Administrators can manage users and groups via the **Administration > 
Security > Users** and **Administration > Security > Groups** menus. From 
here, users can be created, edited, deleted, and assigned to various groups,
and roles can be assigned to control permissions.   

## 6. Audit Logs

SonarQube also provides audit logs that track user actions, such as login 
attempts, configuration changes, and permission modifications. These logs 
help maintain security and accountability within the platform.   

---

## Exercises

## Exercise 1: Viewing and Managing User Profiles

**Objective:** 
Learn how to view and manage user profiles in SonarQube.

**Tasks**:
1. Navigate to the **User Management** section of the SonarQube interface.
2. Search for a user by name or username.
3. Select a user and review their profile information, such as:
   - Username
   - Email
   - Last login date
   - Assigned projects (if applicable)
4. Update the user's profile by editing their **email address** or 
   **password** (if required). 
5. Save the changes and confirm that the profile has been updated successfully.

---

## Exercise 2: Locking and Unlocking a User Account

**Objective:** 
Learn how to lock and unlock user accounts in SonarQube.

**Tasks**:
1. Go to the **User Management** section in the SonarQube interface.
2. Find a user who is inactive or no longer needs access.
3. Lock the user account and note the status change in the user profile.
4. After locking the user, attempt to log in with their credentials (this 
   should fail). 
5. Unlock the user account and confirm that the account is accessible again.
6. Document the steps taken and the changes observed.

---

## Exercise 3: Searching for Users and Filtering Results

**Objective:** 
Learn to efficiently search and filter user lists.

**Tasks**:
1. Navigate to the **User Management** section.
2. Use the search bar to find users based on specific criteria, such as:
   - Username
   - Email
   - Last login time
3. Apply any available filters to narrow down the list of users
   (e.g., filter by users who have not logged in for more than 30 days). 
4. Review the search and filtered results to ensure the correct users are displayed.
5. Experiment with different combinations of search and filter options to 
   refine the user list. 
