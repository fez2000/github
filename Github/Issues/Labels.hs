module Github.Issues.Labels (
 repoLabels
,label
,labelsOnIssue
,module Github.Data
) where

import Github.Data
import Github.Private

repoLabels :: String -> String -> IO (Either Error [IssueLabel])
repoLabels user repoName = githubGet ["repos", user, repoName, "labels"]

labelsOnIssue :: String -> String -> Int ->  IO (Either Error [IssueLabel])
labelsOnIssue user repoName issueId =
  githubGet ["repos", user, repoName, "issues", show issueId, "labels"]

label :: String -> String -> String -> IO (Either Error IssueLabel)
label user repoName labelName =
  githubGet ["repos", user, repoName, "labels", labelName]
