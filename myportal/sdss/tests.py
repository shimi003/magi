from django.test import TestCase
from .views import checkYear
import Utility as u

# Create your tests here.
class CheckYearTests(TestCase):
    def test_checkyear_in_normal1(self):
        year = checkYear('1801')
        self.assertEqual(year,1801)

    def test_checkyear_in_normal2(self):
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

class UtilityTest(TestCase):
     def test_checkyear1():
         year = u.checkYear(2017)
        self.assertEqual(year,datetime.now().year)

     def test_checkyear2():
         year = u.checkYear(2019)
        self.assertEqual(year,2019)

     def test_checkyear3():
         year = u.checkYear(2200)
        self.assertEqual(year,datetime.now().year)

     def test_checkyear4():
         year = u.checkYear('2018')
        self.assertEqual(year,datetime.now().year)

     def test_checkyear5():
         year = u.checkYear('ABC')
        self.assertEqual(year,datetime.now().year)

    def test_checkmonth1():
        month = u.checkMonth(1)
        self.assertEqual(month,1)

    def test_checkmonth2():
        month = u.checkMonth(12)
        self.assertEqual(month,12)

    def test_checkmonth3():
        month = u.checkMonth(0)
        self.assertEqual(month,datetime.now().month)

    def test_checkmonth4():
        month = u.checkMonth(13)
        self.assertEqual(month,datetime.now().month)

    def test_checkmonth5():
        month = u.checkMonth('1')
        self.assertEqual(month,datetime.now().month)
