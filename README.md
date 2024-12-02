
# GitHub Automator

A Bash script that automates various GitHub repository management tasks using the GitHub API. It provides functionality to list collaborators, packages, workflows, discussions, projects, and more. Additionally, it allows following users and retrieving user email information.

## Features

- **List Users with Read Access:** Displays users with pull access to a specified repository.
- **List Packages:** Retrieves all packages within a repository.
- **List Workflows:** Lists all GitHub Actions workflows defined in a repository.
- **List Projects:** Shows the projects associated with a repository.
- **List Discussions:** Displays discussions within the repository.
- **List Issues:** Retrieves a list of issues in the repository.
- **List Pull Requests:** Shows all pull requests in the repository.
- **List Actions Runs:** Lists the action runs for a repository.
- **List User Emails:** Retrieves email addresses associated with the GitHub user.
- **Follow a User:** Follows a specified GitHub user.

## Requirements

- **Bash Shell**
- **curl**: For making HTTP requests.
- **jq**: For parsing JSON responses.
  
  Install `jq` using:
  ```bash
  sudo apt-get install jq  # Debian/Ubuntu
  sudo yum install jq      # CentOS/Fedora
  brew install jq          # macOS
  ```

## Prerequisites

- A GitHub [Personal Access Token (PAT)](https://github.com/settings/tokens) with the following scopes:
  - `repo`, `repo:status`, `repo_deployment`, `public_repo`, `repo:invite`
  - `security_events`, `read:user`, `user:email`, `user:follow`

## Installation

1. Clone the repository or download the script:
   ```bash
   git clone https://github.com/your-username/github-automator.git
   cd github-automator
   ```

2. Make the script executable:
   ```bash
   chmod +x github-automator.sh
   ```

## Usage

1. Run the script:
   ```bash
   ./github-automator.sh
   ```

2. Follow the prompts:
   - Enter your GitHub username.
   - Enter your GitHub personal access token (input is hidden for security).

3. Choose an option from the menu to perform the desired operation.

## Example Output

```
Enter your GitHub username:
Enter your GitHub personal access token:
Ensure your GitHub PAT has the following scopes:
repo, repo:status, repo_deployment, public_repo, repo:invite, security_events,
read:user, user:email, user:follow.

Choose an option:
1. List users with read access
2. List packages
...
Enter your choice: 1
Enter the repository owner:
Enter the repository name:
Users with read access to <owner>/<repo>:
- user1
- user2
```

## Error Handling

- If an error occurs, the script will provide an appropriate message.
- Some operations allow you to retry in case of failure.

## Deployment

You can deploy this script on an AWS EC2 instance or any server with Bash support for remote execution.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Feel free to fork the project, submit pull requests, or report issues.

## Author

- **[ShreyashPG]**  
  [GitHub Profile](https://github.com/ShreyashPG)
