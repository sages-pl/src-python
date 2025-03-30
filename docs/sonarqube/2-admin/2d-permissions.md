# Global and Project Permissions

In SonarQube, **permissions** control what actions users and groups can perform within the platform. These permissions are divided into **global permissions** and **project permissions**, which govern access at different levels of the system. By managing permissions, administrators can ensure that users have the appropriate access to configure, analyze, and interact with SonarQube projects.

## Key Concepts of Global and Project Permissions

### 1. Global Permissions
Global permissions apply across the entire SonarQube instance and are not specific to any individual project. These permissions control the access that users and groups have to system-wide features and administrative functions.

Some common global permissions include:
- **Administer System**: Allows full administrative access to the SonarQube instance, including configuration and managing global settings.
- **Administer Security**: Grants access to manage user roles, groups, and security settings across the entire system.
- **Create Projects**: Allows a user to create new projects within SonarQube.
- **Browse**: Grants read access to view general information about projects, dashboards, and issues, without being able to edit or modify them.
  
These global permissions are typically assigned to **administrators** or **superusers** who need full control over the SonarQube system.

### 2. Project Permissions
Project permissions are more granular and apply only to specific projects within SonarQube. These permissions control what users and groups can do within an individual project, such as running analysis, reviewing issues, or configuring project-specific settings.

Some common project permissions include:
- **Administer Project**: Allows full administrative control over a specific project, including configuration, rule settings, and managing members.
- **Browse Project**: Provides read-only access to a project, including viewing the project's dashboard, issues, and other details.
- **Execute Analysis**: Permits a user to run the analysis on the project (e.g., via SonarScanner or CI integration).
- **Issue View**: Allows users to view the issues in the project but not modify them.
  
Project permissions help control the level of access and responsibilities of different team members within a particular project.

### 3. Managing Permissions
Permissions can be assigned to users directly or through groups. By assigning groups to a project or the global system, administrators can easily manage multiple users' permissions at once.

Permissions are managed through the **Administration > Security > Permissions** section in SonarQube, where administrators can assign roles and permissions to individual users or groups.

---

## Exercises

### Exercise 1: Assign Global Permissions

**Objective**: 
Learn how to assign global permissions to users in SonarQube.

**Tasks**:
1. Navigate to **Administration > Security > Permissions**.
2. Assign a global permission such as **Administer System** or **Create Projects** to a user or group.
3. Verify that the user or group has the correct permissions by attempting to perform an action that requires the new permission.

---

### Exercise 2: Assign Project Permissions

**Objective**: 
Understand how to assign project-specific permissions.

**Tasks**:
1. Navigate to **Administration > Security > Permissions** for a specific project.
2. Assign project-specific permissions such as **Administer Project** or **Execute Analysis** to a user or group.
3. Verify that the user or group can perform the actions allowed by the assigned permissions within the project.

---

### Exercise 3: Review and Audit Permissions

**Objective**: 
Learn how to review and audit the permissions set in SonarQube.

**Tasks**:
1. Go to **Administration > Security > Permissions**.
2. Review the global and project-specific permissions assigned to various users and groups.
3. Check if any user or group has excessive permissions and adjust them if necessary.
