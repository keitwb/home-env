
-- For this to work right, put JENKINS_USER_ID, JENKINS_API_TOKEN, and JENKINS_URL in the
-- environment.
vim.api.nvim_create_autocmd({"BufWritePost", "BufReadPost"}, {
    pattern = {"*Jenkinsfile"},
    callback = function() require("jenkinsfile_linter").validate() end,
  }
)

