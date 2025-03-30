# Rules

In SonarQube, **rules** define the conditions and coding standards that the code is analyzed against. These rules are applied to identify potential issues in the codebase, such as bugs, vulnerabilities, code smells, and duplications. Rules help enforce consistency and maintainability by ensuring that the code adheres to best practices and quality standards.

## Types of Rules

### 1. Code Quality Rules
These rules focus on maintaining good coding practices and ensuring that the code is readable, maintainable, and free from technical debt. Examples include:
- No method should be too long (long method rule).
- Variables should have meaningful names (naming convention rule).

### 2. Security Rules
Security rules are designed to help identify vulnerabilities in the code that may be exploited by attackers. These rules are critical for ensuring the security of the application and preventing security breaches. Examples include:
- No SQL injection vulnerabilities.
- Input data must be sanitized to prevent Cross-Site Scripting (XSS).

### 3. Reliability Rules
These rules aim to ensure that the code behaves reliably and consistently during execution. They help identify potential bugs and other issues that may lead to runtime errors. Examples include:
- Null pointer dereference must be avoided.
- Ensure proper exception handling.

### 4. Maintainability Rules
Maintainability rules ensure that the code is easy to maintain and extend over time. These rules focus on reducing complexity, duplication, and other factors that hinder future development. Examples include:
- Avoid code duplication.
- Limit the size of classes or methods.

### 5. Performance Rules
Performance rules focus on optimizing the code to ensure it runs efficiently. These rules help identify potential bottlenecks or inefficient practices that could degrade performance. Examples include:
- Avoiding excessive memory allocations.
- Using efficient algorithms for common tasks.

## Rule Properties

### 1. Severity
Each rule is associated with a severity level, indicating the impact of violating the rule:
- **Blocker**: Critical issues that must be fixed immediately.
- **Critical**: High-priority issues that need to be addressed quickly.
- **Major**: Important but not urgent issues.
- **Minor**: Low-priority issues.
- **Info**: Non-critical suggestions or improvements.

### 2. Status
A rule's status can be:
- **Active**: The rule is being applied during code analysis.
- **Inactive**: The rule is not currently being applied, either due to being disabled or custom settings.
- **Deprecated**: The rule is outdated and no longer recommended for use.

### 3. Categories
Rules are organized into categories, such as:
- **Bug**
- **Vulnerability**
- **Code Smell**
- **Security**
- **Best Practices**

### 4. Tags
Tags are used to group related rules together and can help in filtering and organizing the rules for easier management.

---

## Exercises

### Exercise 1: Explore Available Rules

**Objective**: 
Familiarize yourself with the rules in SonarQube.

**Tasks**:
1. Go to the **Rules** section of SonarQube.
2. Browse through the available rules and filter them by **category** (e.g., security, code smell).
3. Review the descriptions of at least three rules and note their severity levels.

---

### Exercise 2: Activate/Deactivate a Rule

**Objective**: 
Practice managing rules by activating or deactivating one.

**Tasks**:
1. Go to the **Rules** section in SonarQube.
2. Find a rule you would like to activate or deactivate.
3. Change the status of the rule and note how it affects the quality analysis.

---

### Exercise 3: Create a Custom Rule Profile

**Objective**: 
Create a custom rule profile for a project.

**Tasks**:
1. Go to the **Quality Profiles** section in the **Administration** menu.
2. Create a new profile or modify an existing one.
3. Add or remove specific rules to tailor the profile to your project's needs.
4. Apply the custom rule profile to a project and analyze the results.
