# Static Analysis and Quality Gates

In SonarQube, **static analysis** refers to the process of examining the 
source code of a project to identify potential issues such as bugs, 
vulnerabilities, code smells, and other quality concerns without executing 
the program. This analysis is done based on predefined coding rules and 
metrics. **Quality gates** are an essential feature that help ensure that 
code quality remains high by setting thresholds for key quality metrics. If 
the code doesn't meet the quality gate requirements, it can fail the 
analysis, preventing poor-quality code from being merged or deployed.       

## 1. Static Analysis

Static analysis in SonarQube is a process that inspects the source code of 
a project without running it. The analysis is based on: 

- **Rules**: Predefined checks for various code quality issues like bugs, 
  vulnerabilities, and code smells. 
- **Metrics**: Various measures such as complexity, duplication, and test 
  coverage. 
  
SonarQube uses different analyzers (e.g., Java, JavaScript, C#, etc.) to 
perform this static analysis and generate reports on the code's quality. 
The results are categorized into:  

- **Bugs**: Defects that might lead to errors in the code.
- **Vulnerabilities**: Potential security risks in the code.
- **Code Smells**: Practices that may not necessarily be wrong but could be improved.
- **Duplications**: Duplicate code sections that may affect maintainability.

## 2. Quality Gates

A **quality gate** is a set of conditions that a project must meet before 
it is considered ready for deployment or integration. Quality gates allow 
you to enforce specific rules and metrics for code quality. SonarQube 
provides a default quality gate, but custom gates can be defined to better 
suit specific project requirements.    

Common conditions for quality gates include:

- **No new critical or blocker issues**: Prevent critical or blocker issues 
  from being introduced into the codebase. 
- **Code coverage on new code**: Ensure a specific level of test coverage 
  for new or modified code. 
- **Maintainability**: Ensure that the codebase is not becoming too complex 
  or difficult to maintain. 
- **Duplications**: Limit the percentage of duplicated code in the project.

If the project does not meet the quality gate criteria, the analysis will 
fail, and the build will be marked as "failed" in the CI/CD pipeline. 

## 3. Default Quality Gate

- No new critical issues.
- No new blocker issues.
- Coverage on new code.
- No new duplication.

These conditions ensure that every project analyzed maintains a baseline 
level of code quality. 

## 4. Custom Quality Gates

Administrators can create custom quality gates that enforce specific 
thresholds for metrics like: 

- **Bugs**: Max number of bugs allowed.
- **Vulnerabilities**: Maximum number of vulnerabilities permitted.
- **Code Coverage**: Minimum percentage of code coverage required for new code.
- **Duplications**: Maximum allowed duplicated lines.

Custom quality gates can be tailored for different types of projects and 
development standards. 

---

## Exercises

### Exercise 1: Review and Modify the Default Quality Gate

**Objective**: 
Learn how to review and adjust the default quality gate settings in SonarQube.

**Tasks**:
1. Navigate to **Administration > Quality Gates** in SonarQube.
2. Review the default quality gate and its conditions.
3. Modify the conditions, such as increasing the minimum code coverage or 
   changing the allowed number of bugs. 
4. Apply the modified quality gate to a project.

---

### Exercise 2: Create and Assign a Custom Quality Gate

**Objective**: 
Practice creating and assigning a custom quality gate to a project.

**Tasks**:
1. Navigate to **Administration > Quality Gates**.
2. Create a custom quality gate by specifying conditions like coverage on 
   new code, bug thresholds, and duplication limits. 
3. Assign the custom quality gate to a project.
4. Run an analysis on the project and ensure that it passes or fails based 
   on the custom gate conditions. 

---

### Exercise 3: Analyze Static Analysis Results and Improve Code Quality

**Objective**: 
Review the static analysis results and fix issues based on SonarQube's findings.

**Tasks**:
1. Run a static analysis on a sample project.
2. Review the findings under the **Issues** tab for categories like bugs, 
   vulnerabilities, and code smells. 
3. Fix the identified issues in the codebase.
4. Re-run the analysis to confirm that the issues are resolved and the 
   quality gate passes. 
