local M = {}

function M.setup()
    local ls = require("luasnip")  -- Ensure LuaSnip is installed
    local s = ls.snippet
    local t = ls.text_node

    ls.add_snippets("yaml", {
        s("gh-action", {
            t({
                "name: CI/CD Workflow",
                "on: [push, pull_request]",
                "jobs:",
                "  build:",
                "    runs-on: ubuntu-latest",
                "    steps:",
                "      - name: Checkout repository",
                "        uses: actions/checkout@v2",
                "",
                "      - name: Setup Node.js",
                "        uses: actions/setup-node@v3",
                "        with:",
                "          node-version: '16'",
                "",
                "      - name: Install dependencies",
                "        run: npm install",
                "",
                "      - name: Run tests",
                "        run: npm test",
            }),
        }),

        s("gh-docker", {
            t({
                "name: Docker Build & Push",
                "on: push",
                "jobs:",
                "  docker:",
                "    runs-on: ubuntu-latest",
                "    steps:",
                "      - name: Checkout repository",
                "        uses: actions/checkout@v2",
                "",
                "      - name: Log in to Docker Hub",
                "        run: echo \"${{ secrets.DOCKER_PASSWORD }}\" | docker login -u \"${{ secrets.DOCKER_USERNAME }}\" --password-stdin",
                "",
                "      - name: Build and push Docker image",
                "        run: |",
                "          docker build -t my-image:latest .",
                "          docker tag my-image:latest my-dockerhub-user/my-image:latest",
                "          docker push my-dockerhub-user/my-image:latest",
            }),
        }),
    })
end

return M
