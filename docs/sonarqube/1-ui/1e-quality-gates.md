# Quality Gates

A **Quality Gate** in SonarQube is a set of conditions that a project must 
meet to be considered "healthy." These conditions are used to ensure that 
the code meets predefined quality standards. Quality Gates can be 
customized to include various criteria, such as no critical bugs or 
vulnerabilities, minimum test coverage ratios. 
The goal  of a Quality Gate is to prevent problematic code from being 
merged into production or deployed.      

## 1. Conditions

- **No critical or blocker issues**: The project cannot have any critical 
  or blocker bugs or vulnerabilities. 
- **Test coverage**: The project must have a minimum percentage of unit 
  test coverage (e.g., 80%).
- **Duplications**: The level of duplicated code must be below a specified 
  percentage. 

## 2. Quality Gate Status

- **Passed**: If the project meets all the conditions of the Quality Gate.
- **Failed**: If any of the conditions are violated.
- **Unknown**: If the project has not been analyzed recently or has not yet 
  met the requirements for the Quality Gate. 

## 3. Default Quality Gate

- No blocker or critical issues.
- Minimum test coverage.
- No new code smells.

## 4. Custom Quality Gates

Projects can have custom quality gates to better fit their needs. For 
example, a project might require a higher test coverage percentage or a 
stricter limit on technical debt. Custom quality gates can be created by 
administrators and applied to specific projects or branches.   

## 5. Quality Gate for Pull Requests

SonarQube can apply quality gates specifically to pull requests. This 
ensures that only code that meets the quality standards is merged into the 
main branch. Pull request quality gates allow teams to maintain 
high-quality code even before merging.   

## Managing Quality Gates

Quality gates can be configured and modified in the **Quality Gates** menu 
under the **Administration** settings. Users can define new gates, assign 
them to projects, and adjust the conditions as needed.   

---

## Exercises

### Exercise 1: Check the Quality Gate Status

**Objective**: 
Review a project's Quality Gate status.

**Tasks**:
1. Go to the **Project Overview** page.
2. Find the **Quality Gate Status** indicator.
3. Identify if the project has passed or failed the quality gate and note 
   the reason for failure (if applicable). 

---

### Exercise 2: Modify a Quality Gate Condition

**Objective**: 
Learn how to modify the conditions of a Quality Gate.

**Tasks**:
1. Navigate to the **Quality Gates** section in the **Administration** menu.
2. Edit the default quality gate and modify a condition 
   (change the required test coverage percentage to 85%). 
3. Apply the new quality gate to a specific project.

---

### Exercise 3: Configure a Quality Gate for a Pull Request (Developer Edition)

**Objective**: 
Set up a Quality Gate for pull requests to ensure code quality before merging.

**Tasks**:
1. Go to the **Pull Requests** section of a project.
2. Check if a quality gate is applied to incoming pull requests.
3. Create a rule that fails the pull request if it introduces new code 
   smells or reduces test coverage. 
