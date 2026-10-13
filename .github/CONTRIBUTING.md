# Contributing
Coding style is not fixed (yet). There are plans to add automatic formatting later down the line.
If you are interested in getting that going, feel free to open a Pull Request with an actions setup that works with latexindent and my latexindent config from [here](https://git.janishutz.com/janishutz/dotfiles/src/branch/main/config/lint/latexfmt.yaml)

## Updating existing summaries
- Do not change the helper file import. If you have an idea as to how we could improve the import, open an issue.
- Compile before uploading such that the PDFs are up-to-date
- (Optional) Add your name to the credits for the summary if you have made a contribution beyond a small fix. Your username will be in the `git blame` regardless.
- Open a pull request

## Adding a new summary
- include all the `.tex` files that are needed to compile the latex document.
- include any images or other files that are necessary to compile
- Compile the document
- (Optional) Configure auto-upload. To add a secret, please let us know that you want to do that in the PR and you will be given access to add secrets

## What we will accept
- Summaries written with my helpers / styling
- Summaries written using your own styling
- Summaries for electives in the field of CS
- Summaries for all subjects of BSc and MSc Computer Science at ETHZ

## What will not be accepted
- Summaries with many obvious errors
- Summaries not written in any TeX distribution or Typst
- Summaries that do not compile on our end
- Summaries for subjects that are not offered at ETHZ in BSc and MSc Computer Science
- Summaries not following common design practices for LaTeX
- Summaries for GESS subjects


## AI usage
As much as I hate writing this section, it's important.

- You *MAY* use AI to check your own changes or to find obvious errors in the existing summaries.
- You *MAY* use AI to fix said issues
- You *MAY* use AI to create Tikz graphics or the like
- You *MAY* use AI to create examples, if you sanity check and rewrite them yourself as needed.
- You *MAY **NOT*** submit the above without human oversight. Please check them against the script manually. Otherwise that burden falls fully on the maintainers.
- You *MAY **NOT*** submit AI-written sections. At least rewrite them yourself to make them align with the general writing style of each summary.
- You *MAY **NOT*** submit any AI-generated images
- You *MAY **NOT*** use AI to communicate in PR chats. Especially regarding suggested changes because making them is quite a lot of effort for us,
whereas for you it mostly is just hitting accept, or adding your own suggestion to our recommendations
- You *MUST* mention that you used AI to help create this PR.
