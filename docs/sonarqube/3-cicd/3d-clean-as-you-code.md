# Clean as You Code

The **Clean as You Code** concept in SonarQube emphasizes addressing code 
quality issues as they arise during the development process, rather than 
waiting for a later stage to fix them. This approach integrates continuous 
code quality checks within the development workflow, enabling teams to 
prevent the accumulation of technical debt and maintain high-quality code 
throughout the project lifecycle.     

By using tools like SonarQube and applying quality gates and static 
analysis during the development process, teams can ensure that code is 
written with minimal defects and aligns with best practices from the very 
start. This concept promotes proactive issue resolution, reducing the risk 
of code defects and improving maintainability over time.    

## 1. Continuous Quality Checks

SonarQube helps teams to continuously check for code quality issues as new 
code is committed, typically in a **Continuous Integration (CI)** pipeline. 
When each commit triggers an analysis, developers receive immediate 
feedback on new issues, such as bugs, vulnerabilities, or code smells, 
enabling them to address these issues right away.    

## 2. Quality Gates

In the **Clean as You Code** model, **quality gates** are used to enforce 
specific criteria that new code must meet before it can be merged into the 
main branch. 

For example:  
- No new blocker or critical issues.
- Sufficient unit test coverage.
- No new code duplication.

Quality gates ensure that developers don't introduce new issues into the 
codebase and that only high-quality code is allowed to proceed. 

## 3. Immediate Feedback

The concept relies heavily on providing **immediate feedback** to 
developers through SonarQube's integration with CI tools like Jenkins, 
GitLab CI, or GitHub Actions. This way, developers are notified of any 
issues as soon as possible and can address them before they become part of 
the final product.    

## 4. Incremental Analysis

Rather than analyzing the entire codebase each time, SonarQube performs 
**incremental analysis** on the code that has changed. This allows 
developers to focus on fixing only the newly introduced issues, avoiding 
the need to recheck the entire codebase.

---

## Exercises

### Exercise 1: Set Up a Quality Gate for New Code

**Objective**: 
Learn how to configure and use quality gates to enforce clean code practices.

**Tasks**:
1. Navigate to **Administration > Quality Gates** in SonarQube.
2. Create a quality gate that ensures **no new critical issues** and 
   requires **minimum code coverage**. 
3. Apply the quality gate to a project.
4. Test the quality gate by committing new code with potential issues, then 
   check if the gate prevents the code from being merged.  

---

### Exercise 2: Integrate SonarQube with a CI/CD Pipeline

**Objective**: 
Practice integrating SonarQube with a CI/CD pipeline to check code quality on each commit.

**Tasks**:
1. Set up a **SonarQube analysis** in your CI pipeline (e.g., Jenkins, 
   GitHub Actions, or GitLab CI). 
2. Configure your pipeline to run SonarQube on each commit and report 
   issues in real-time. 
3. Commit new code to see if the pipeline catches any issues and blocks the 
   merge if the quality gate fails. 

---

### Exercise 3: Review and Fix Issues from SonarQube Feedback

**Objective**: 
Learn how to review SonarQube feedback and fix issues immediately.

**Tasks**:
1. Run a **SonarQube analysis** on your project.
2. Review the **Issues** tab for newly introduced bugs, vulnerabilities, or 
   code smells. 
3. Address the issues by modifying the code and re-running the analysis to 
   ensure all problems are resolved. 
