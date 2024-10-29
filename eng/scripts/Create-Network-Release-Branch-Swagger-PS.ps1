name: Checkout New Branch for Swagger & .NET

on:
  pull_request:
    types: [closed]
    branches:
      - main

jobs:
  checkout_new_branch:
    if: github.event.pull_request.merged == true && github.event.pull_request.head.ref == 'xyz'
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Run PowerShell script
        run: pwsh create_new_branch.ps1

