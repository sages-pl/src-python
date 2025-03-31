# Issues and Their Properties

In SonarQube, **issues** refer to problems detected during the static code 
analysis of a project. These can range from bugs and vulnerabilities to 
code smells and maintainability concerns. Issues are categorized based on 
their severity, type, and location within the code, making it easier for 
developers to prioritize and address them.    

## 1. Bugs

- **Definition**: Bugs are issues that may lead to runtime errors or 
  unexpected behavior in the application.
- **Impact**: Bugs should be fixed promptly, as they often affect the 
  functionality of the application.
- **Severity**: Bugs can be classified as Blocker, Critical, Major, Minor, 
  or Info, depending on their impact. 

## 2. Vulnerabilities

- **Definition**: Vulnerabilities are security-related issues that can 
  expose the application to attacks, such as SQL injection, Cross-Site 
  Scripting (XSS), or improper access controls.
- **Impact**: Vulnerabilities can have serious consequences, including data 
  breaches or unauthorized access.
- **Severity**: Like bugs, vulnerabilities are classified by severity 
  (Blocker, Critical, Major, Minor, Info). 

## 3. Code Smells

- **Definition**: Code smells are maintainability issues that don't 
  necessarily affect functionality but can make the code harder to understand 
  or maintain over time.
- **Examples**: Long methods, duplicated code, and poor variable naming.
- **Impact**: Code smells generally increase the technical debt and make 
  the project harder to maintain in the long term. 

## 4. Duplications

- **Definition**: Duplicated code refers to identical or similar sections 
  of code repeated in multiple places.
- **Impact**: Duplicated code increases maintenance complexity and the 
  likelihood of bugs when changes need to be applied to all instances of the 
  duplicate code.
- **Severity**: Duplications are not typically classified by severity but 
  are tracked to indicate areas for refactoring. 

## Issue Properties

### 1. Severity

- **Blocker**: Critical issues that need immediate attention.
- **Critical**: High-severity issues that should be addressed quickly.
- **Major**: Important but not immediately urgent.
- **Minor**: Issues that are less impactful but still worth addressing.
- **Info**: Low-priority issues, often cosmetic or minor improvements.

### 2. Type

- **Bug**: A defect that could cause an error or unexpected behavior.
- **Vulnerability**: A security issue that could expose the project to risks.
- **Code Smell**: A maintainability issue that suggests poor coding practices.
- **Duplicated Code**: Repeated code that should be refactored.

### 3. Status

- **Open**: The issue has been detected but not yet resolved.
- **Fixed**: The issue has been resolved and no longer appears in the codebase.
- **Won't Fix**: The issue has been reviewed and is considered non-actionable or irrelevant.
- **Reopened**: An issue that was previously fixed but has reappeared after a code change.

### 4. Assignee

Issues can be assigned to a specific developer or team responsible for 
fixing them. 

### 5. Location

- **File**: The file where the issue was detected.
- **Line Number**: The specific line in the file where the issue is located.

### 6. Tags

Tags can be used to categorize issues, making it easier to group and filter 
them. For example, tags could include "security", "refactoring", or "test". 

---

## Exercises

### Exercise 1: Explore the Issues Dashboard

**Objective**: 
Familiarize yourself with the issues dashboard and how issues are categorized.

**Tasks**:
1. Open the **Issues** section of a project in SonarQube.
2. Filter issues by **severity** (Blocker, Critical, Major, etc.).
3. Review a few issues and note their **type**, **severity**, and **status**.

---

### Exercise 2: Investigate and Prioritize Issues

**Objective**: 
Learn how to prioritize issues based on severity and impact.

**Tasks**:
1. Go to the **Issues** section and filter for **Blocker** or **Critical** issues.
2. Review the issues and note their **location** and **type**.
3. Create a plan to address at least three of the most critical issues.

---

### Exercise 3: Analyze Code Smells and Duplications

**Objective**: 
Understand the impact of code smells and duplicated code.

**Tasks**:
1. Go to the **Code Smells** section and filter for **Major** 
   and **Minor** issues.
2. Review the **duplicated code** section and identify parts of the code 
   that need refactoring. 
3. Suggest ways to improve the maintainability of the code by addressing 
   the identified code smells and duplications. 
