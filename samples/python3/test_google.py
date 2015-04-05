import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class ExampleTests(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()

    def test_google_title_matches_correct_value(self):
        self.driver.get("http://www.google.com")
        assert "Google" in self.driver.title

    def tearDown(self):
        self.driver.close()
