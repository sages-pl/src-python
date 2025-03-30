# SAST (Static Application Security Testing)

**SAST (Static Application Security Testing)** is a security analysis 
method used in SonarQube to identify vulnerabilities and security flaws in 
the source code before the application is run. SAST is designed to detect 
potential risks early in the development cycle by analyzing the code for 
issues that could lead to security vulnerabilities, such as SQL injection, 
cross-site scripting (XSS), and insecure data handling.     

SonarQube integrates SAST capabilities to automatically scan the codebase 
and flag issues that could compromise the security of the application. By 
leveraging SAST, developers can address security concerns during the 
development phase, reducing the cost and complexity of fixing 
vulnerabilities later in the deployment process.    

## Key Features of SAST in SonarQube

### 1. Security Vulnerabilities Detection

- **SQL Injection**: Unchecked user inputs could allow attackers to 
  manipulate database queries. 
- **Cross-Site Scripting (XSS)**: Failure to properly sanitize user input 
  can allow attackers to inject malicious scripts into the application.  
- **Hardcoded Secrets**: Detection of hardcoded passwords, API keys, and 
  other sensitive information in the code. 

### 2. Customizable Security Rules

SonarQube provides a wide set of built-in security rules that help detect 
common vulnerabilities. These rules can be customized to better fit the 
specific needs of a project or organization, ensuring that security 
standards align with the project's goals.   

### 3. Integration with Security Plugins

SonarQube's SAST capabilities are often enhanced by integrating additional 
security plugins (such as the **SonarQube Security Plugin** or 
**SonarLint**), which offer more advanced security checks and deeper code 
analysis for security flaws.   

### 4. Security Hotspots

SonarQube introduces the concept of **Security Hotspots**, which are 
potential security issues that might need manual review. These are areas of 
the code where vulnerabilities could exist, but the tool requires a human 
to assess the severity and validity of the issue. It flags areas of the 
code for review, allowing teams to focus on critical sections of the code 
that require further investigation.     

### 5. Risk-Based Prioritization

Security issues found by SAST are categorized and prioritized by their 
severity (e.g., Blocker, Critical, Major). This allows developers to focus 
on the most critical vulnerabilities first, ensuring the most pressing 
security concerns are addressed early in the development lifecycle.   

### 6. Continuous Scanning

SonarQube continuously analyzes code during integration cycles, which means 
that every commit and pull request can be automatically scanned for 
security vulnerabilities. This helps identify and fix security issues 
continuously rather than waiting for periodic security audits.   

---

## Exercises

### Exercise 1: Review Security Vulnerabilities

**Objective**: 
Learn how to identify security vulnerabilities in the codebase using SonarQube.

**Tasks**:
1. Navigate to the **Issues** section in a SonarQube project.
2. Filter and search for issues related to **security** (SQL Injection, XSS, etc.).
3. Review and categorize the security issues by severity.

---

### Exercise 2: Analyze Security Hotspots

**Objective**: 
Learn to identify and review **Security Hotspots** in the project.

**Tasks**:
1. Go to the **Security Hotspots** section in the SonarQube dashboard.
2. Identify code sections flagged as security hotspots.
3. Investigate and mark whether they are genuine issues or require further action.

---

### Exercise 3: Customize Security Rules

**Objective**: 
Customize SonarQube's security rules to better fit project needs.

**Tasks**:
1. Navigate to **Quality Profiles** under **Administration**.
2. Find the security rules and modify one (e.g., disable or configure a 
   rule based on project needs). 
3. Apply the updated rule set to a project and run a new analysis to see 
   how it affects security scanning. 
