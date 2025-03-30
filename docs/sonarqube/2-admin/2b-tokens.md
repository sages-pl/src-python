# Tokens

In SonarQube, **tokens** are used to authenticate and authorize interactions with the platform, particularly for continuous integration (CI) or automated tools. Tokens provide a secure way for users and systems to communicate with SonarQube without exposing sensitive credentials such as usernames and passwords. They are commonly used for project analysis, API access, or integration with build tools and CI systems.

## Key Concepts of Tokens in SonarQube

### 1. **What is a Token?**
A token is a unique, secure string of characters that acts as an alternative to using a username and password. When performing automated tasks such as running SonarQube analysis or accessing the SonarQube API, users or CI/CD tools can use tokens for authentication.

### 2. **Types of Tokens**
There are generally two types of tokens in SonarQube:
- **User Tokens**: Created by individual users and associated with their account. These tokens provide access based on the permissions of the user.
- **CI/CD Tokens**: Created for integration purposes and used by build systems or CI/CD pipelines. These tokens typically have project-specific access and are used to automate processes.

### 3. **Creating and Managing Tokens**
Tokens can be generated in SonarQube through the **My Account > Security** section. Users can create tokens that are tied to their individual account, which are then used for authenticating API requests or CI/CD interactions.

Once a token is created, SonarQube does not store the value of the token for security reasons, so it must be copied and stored securely at the time of creation.

### 4. **Revoking Tokens**
If a token is compromised or no longer needed, it can be revoked through the **My Account > Security** section. Once revoked, the token will no longer be valid, and any system relying on that token will no longer be able to authenticate with SonarQube.

### 5. **Token Use Cases**
- **CI/CD Integration**: Automate the analysis of projects during build or deployment pipelines.
- **API Access**: Secure API interactions, such as retrieving analysis reports or project details programmatically.
- **Third-Party Tools**: Tools such as SonarScanner, Jenkins, or GitLab CI can use tokens for connecting with SonarQube.

### 6. **Token Security**
Tokens are a secure way to authenticate without sharing passwords. However, it is important to treat tokens as sensitive information and store them securely. Never expose tokens in publicly accessible areas like GitHub repositories or log files.

---

## Practice Tasks for Students

### Task 1: Create a Personal Token
- **Objective**: Learn how to create and manage a personal token in SonarQube.
- **Steps**:
  1. Navigate to **My Account > Security** in SonarQube.
  2. Create a new token for your user account.
  3. Copy the token and store it securely.
  4. Use the token in a tool such as **SonarScanner** to authenticate and run a project analysis.

---

### Task 2: Use a Token in CI/CD Pipeline
- **Objective**: Integrate SonarQube analysis into a CI/CD pipeline using a token.
- **Steps**:
  1. Create a token in **My Account > Security**.
  2. Configure your CI/CD system (e.g., Jenkins or GitLab) to use this token for SonarQube analysis.
  3. Trigger a build and verify that SonarQube analysis runs successfully using the token.

---

### Task 3: Revoke an Old Token
- **Objective**: Learn how to revoke a token that is no longer needed.
- **Steps**:
  1. Go to **My Account > Security** and find a previously created token.
  2. Revoke the token.
  3. Verify that the token is no longer valid by attempting to use it for API access or analysis.

---

These tasks will help students understand how to generate, manage, and securely use **tokens** in SonarQube, enhancing their ability to automate and secure interactions with the platform.
