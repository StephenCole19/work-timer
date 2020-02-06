import webbrowser
import sys

url = 'https://www.briantracy.com/blog/personal-success/26-motivational-quotes-for-success/'

# MacOS
chrome_path = 'open -a /Applications/Google\ Chrome.app %s'
firefox_path = 'open -a /Applications/Firefox.app %s'

if sys.argv[1] == "firefox":
    browser = webbrowser.get(firefox_path)
else:
    browser = webbrowser.get(chrome_path)


browser.open(url)

for x in range(1, 20):
    browser.open_new_tab(url)

