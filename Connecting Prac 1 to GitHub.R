# connecting project to GitHub

usethis::use_git()

# You will not need to install usethis and set Git authorship information for each project, but you will need to initialise Git for each project.

# --------------------Connecting Git to GitHub-------------------------

usethis::create_github_token()

#Name the token, set the expiry date and click on Create. Then copy the token (it looks like ghp_akerjlwk4j5qlk45j).
# mine was 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

# close R and restart
## run this in your console
gitcreds::gitcreds_set()
#and paste your token.

usethis::use_git()


# can type into the console to check commits 
$gitstatus
$gitstatus-s
$gitlog--oneline-5 # shows the last 5 commits