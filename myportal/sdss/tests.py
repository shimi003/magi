from django.test import TestCase
from .views import checkYear

# Create your tests here.
class SdssTests(TestCase):
    def test_checkyear_in_normal1(self):
        year = checkYear('1801')
        self.assertEqual(year,1801)

    def test_checkyear_in_normal(self):
        year = checkYear('2099')
        self.assertEqual(year,2099)

    def test_checkyear_in_abnormal1(self):
        from datetime import datetime
        year = checkYear('1800')
        self.assertEqual(year,datetime.now().year)

    def test_checkyear_in_abnormal2(self):
        from datetime import datetime
        year = checkYear('2100')
        self.assertEqual(year,datetime.now().year)

    def test_checkyear_in_abnormal3(self):
        from datetime import datetime
        year = checkYear('-1900')
        self.assertEqual(year,datetime.now().year)

    def test_checkyear_in_abnormal4(self):
        from datetime import datetime
        year = checkYear('abc')
        self.assertEqual(year,datetime.now().year)
