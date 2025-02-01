local M = {}

function M.setup()

  -- Require and setup the workflow snippets
  require("github_actions_snippets.snippets.basic_workflow")

  -- Require and setup the on snippets
  require("github_actions_snippets.snippets.on_trigger")

end

return M

