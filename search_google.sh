#!/bin/bash

# Check if Node.js and npm are installed
if ! command -v node &> /dev/null || ! command -v npm &> /dev/null; then
    echo "Node.js and npm are required. Please install them first."
    exit 1
fi

# Install puppeteer if not already installed
if ! npm list -g | grep -q puppeteer; then
    npm install -g puppeteer
fi

# Node.js script to open Google and search for "Jenkins pipelines"
node - <<EOF
const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({ headless: false }); // Set headless to true for headless mode
  const page = await browser.newPage();
  await page.goto('https://www.google.com');
  await page.type('input[name=q]', 'Jenkins pipelines');
  await page.keyboard.press('Enter');

  // Wait for a few seconds to see the result (adjust as needed)
  await page.waitForTimeout(5000);

  await browser.close();
})();
EOF
