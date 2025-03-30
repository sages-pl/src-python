# Quality Metrics

Quality metrics in SonarQube provide valuable insights into the health of a codebase. These metrics allow developers to track the quality, maintainability, and security of their projects over time. They help identify areas for improvement and ensure that the code meets the required quality standards.

## Key Quality Metrics in SonarQube

### 1. **Bugs**
- **Definition**: Bugs are issues in the code that could cause runtime errors or unexpected behavior.
- **Severity Levels**: Bugs are typically classified by their severity (e.g., Blocker, Critical, Major, Minor). Blocker and Critical bugs should be fixed first, as they can directly impact the functionality of the application.

### 2. **Vulnerabilities**
- **Definition**: Vulnerabilities are security flaws that can potentially be exploited by attackers to compromise the application or system.
- **Examples**: SQL injection, Cross-Site Scripting (XSS), and improper access controls are common security vulnerabilities.
- **Severity Levels**: Like bugs, vulnerabilities are categorized into severity levels: Blocker, Critical, Major, and Minor.

### 3. **Code Smells**
- **Definition**: Code smells are maintainability issues that might not cause immediate functional problems but could make the code harder to understand, maintain, or extend.
- **Examples**: Long methods, duplicated code, and poor variable naming are common code smells.
- **Impact**: While code smells do not affect functionality, they can significantly increase the cost and time required to maintain the code in the future.

### 4. **Duplications**
- **Definition**: Duplicated code refers to sections of code that are repeated in multiple places.
- **Impact**: Duplications make code harder to maintain and increase the risk of errors since fixing an issue in one part of the code might not propagate to all duplicates.
- **Metric**: Duplications are measured as a percentage of the codebase that is repeated.

### 5. **Test Coverage**
- **Definition**: Test coverage measures the percentage of the codebase covered by automated tests.
- **Goal**: Higher test coverage generally means fewer untested parts of the code, leading to better code quality and fewer bugs.
- **Recommended Coverage**: A typical goal is 80% test coverage, but the ideal percentage depends on the project’s needs.

### 6. **Technical Debt**
- **Definition**: Technical debt is the amount of time required to fix issues in the code that have been identified by SonarQube.
- **Impact**: High technical debt indicates that the code has numerous issues that require time and effort to resolve. Reducing technical debt improves the maintainability of the code over time.
- **Metric**: Technical debt is often expressed in hours or days and includes the time needed to fix bugs, vulnerabilities, and code smells.

### 7. **Reliability Rating**
- **Definition**: The reliability rating measures the overall reliability of the project based on the severity and number of bugs.
- **Scale**: Reliability is rated on a scale of A (best) to E (worst), based on the number and severity of the detected bugs.
- **Impact**: A high reliability rating means that the project is less likely to experience issues that could affect its functionality.

### 8. **Security Rating**
- **Definition**: The security rating measures the overall security of the project based on the number and severity of vulnerabilities.
- **Scale**: Like reliability, security is rated from A (best) to E (worst).
- **Goal**: A high security rating indicates fewer vulnerabilities and a more secure application.

### 9. **Maintainability Rating**
- **Definition**: The maintainability rating evaluates how easy it is to maintain and extend the project’s codebase.
- **Scale**: This rating is also on a scale from A to E.
- **Factors**: The rating considers issues like code smells, complexity, and code duplication.

---

## Practice Tasks for Students

### Task 1: Review the Project’s Key Metrics
- **Objective**: Navigate the Quality Metrics section and review the project's overall health.
- **Steps**:
  1. Open the **Quality Metrics** section of a project in SonarQube.
  2. Identify the current number of **bugs**, **vulnerabilities**, and **code smells**.
  3. Check the **test coverage** and **technical debt** metrics for the project.

---

### Task 2: Investigate Duplications and Code Smells
- **Objective**: Examine code duplications and code smells to identify potential areas for improvement.
- **Steps**:
  1. Go to the **Duplications** section and review the percentage of duplicated code.
  2. Navigate to the **Code Smells** section and filter for the most common issues.
  3. Document at least three examples of duplicated code or code smells that could be addressed.

---

### Task 3: Analyze Security and Reliability Ratings
- **Objective**: Explore the project’s security and reliability ratings and understand the associated risks.
- **Steps**:
  1. Open the **Security Rating** and **Reliability Rating** sections.
  2. Check the current rating (A, B, C, D, E) for both security and reliability.
  3. Review the critical **vulnerabilities** or **bugs** that might be affecting the project’s ratings.

---

These tasks will help students practice navigating SonarQube's quality metrics and understand how each metric impacts the overall quality, security, and maintainability of the project.
