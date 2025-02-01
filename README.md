# nvim-gh-actions-snippets 🚀

*A Neovim plugin that injects GitHub Actions workflow snippets for LuaSnip, making CI/CD setup effortless.*

## 📜 Features
- Predefined GitHub Actions workflow snippets for common use cases.
- Seamless integration with `LuaSnip` for quick snippet expansion.
- Auto-loads snippets for YAML filetype.
- Easily extensible with custom snippets.

## 📦 Installation (Lazy.nvim)
Add the following to your `lazy.nvim` config:

```lua
{
    "your-username/nvim-gh-actions-snippets",
    config = function()
        require("github_actions_snippets").setup()
    end,
    dependencies = { "L3MON4D3/LuaSnip" },
}
```

## 🔧 Usage
- Type `gh-action` inside a YAML file and expand it using your snippet trigger.
- Type `gh-docker` to quickly scaffold a Docker-based GitHub Actions workflow.

## 📌 Example Snippets
### GitHub Actions CI/CD Workflow
```yaml
name: CI/CD Workflow
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '16'

      - name: Install dependencies
        run: npm install

      - name: Run tests
        run: npm test
```

### Docker Build & Push
```yaml
name: Docker Build & Push
on: push
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Log in to Docker Hub
        run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

      - name: Build and push Docker image
        run: |
          docker build -t my-image:latest .
          docker tag my-image:latest my-dockerhub-user/my-image:latest
          docker push my-dockerhub-user/my-image:latest
```

## 🚀 Contributing
Feel free to open issues or PRs to add more GitHub Actions snippets!

## 📜 License
This plugin is licensed under the MIT License.

