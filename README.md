# GitHub Repository Management Tool (my-github-manager)

A comprehensive command-line tool for managing GitHub repositories. This tool provides various automation features for GitHub repository management tasks using the GitHub API.

![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![NPM](https://img.shields.io/badge/NPM-%23CB3837.svg?style=for-the-badge&logo=npm&logoColor=white)

## 🚀 Features

- 📋 List repository collaborators with read access
- 📦 View repository packages
- 🔄 List GitHub Actions workflows
- 📊 Browse repository projects
- 💬 Access repository discussions
- 🎫 Track issues and pull requests
- 📈 Monitor GitHub Actions runs
- 📧 Manage user emails
- 👥 Follow/unfollow users
- 📨 Handle repository invitations
- 📝 View commit history
- 👤 Access user profile data

## 📋 Prerequisites

### System Requirements
- Node.js (v12 or higher)
- Bash shell environment
- curl
- jq (JSON processor)

### Installing Dependencies

#### Linux (Debian/Ubuntu)
```bash
sudo apt-get update
sudo apt-get install curl jq
```

#### macOS
```bash
brew install curl jq
```

#### Windows
```bash
# Using Chocolatey
choco install curl jq

# Make sure Git Bash is installed
# Download from: https://git-scm.com/downloads
```

### GitHub Personal Access Token
You need a GitHub Personal Access Token with the following scopes:
- Repository access: `repo`, `repo:status`, `repo_deployment`, `public_repo`, `repo:invite`
- Security access: `security_events`
- User access: `read:user`, `user:email`, `user:follow`

[Create a new token here](https://github.com/settings/tokens)

## 📥 Installation

Install globally using npm:
```bash
npm install -g my-github-manager
```

## 🎮 Usage

1. Start the tool:
```bash
my-github-manager
```

2. Enter your credentials when prompted:
   - GitHub username
   - GitHub Personal Access Token (PAT)

3. Choose from the available options in the menu:
```
1. List users with read access
2. List packages
3. List workflows
4. List projects
5. List discussions
6. List issues
7. List pull requests
8. List actions
9. List user emails
10. Follow a user
11. List repository invitations
12. List all public repositories of a user
13. Get commit history of a public repository
14. Get user profile data
15. Exit
```

## 🔍 Example Usage

### Listing Repository Collaborators
```bash
$ my-github-manager
> Enter your choice: 1
> Enter the repository owner: octocat
> Enter the repository name: Hello-World

Users with read access to octocat/Hello-World:
- user1
- user2
```

### Following a User
```bash
$ my-github-manager
> Enter your choice: 10
> Enter the username to follow: octocat

Successfully followed octocat.
```

## ⚠️ Error Handling

The tool includes robust error handling:
- Authentication validation
- API response checking
- Retry options for failed operations
- Clear error messages

## 🔐 Security Notes

- Never share your Personal Access Token
- Token is read securely (hidden input)
- Temporary files are handled securely
- No sensitive data is logged

## 🛠️ Troubleshooting

Common issues and solutions:

1. Authentication Failed
   - Verify your GitHub username
   - Check if your PAT has expired
   - Ensure correct PAT scopes are enabled

2. Command Not Found
   - Verify global npm installation
   - Check if PATH includes npm global binaries

3. jq Not Found
   - Install jq using package manager
   - Verify jq installation in PATH

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## ✨ Acknowledgments

- GitHub API Documentation
- jq Documentation
- Shell Scripting Community

## 📞 Support

For support, please:
1. Check existing issues
2. Create a new issue with detailed description
3. Include error messages and environment details

---

Made with ❤️ for the GitHub community
