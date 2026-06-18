from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

class Book(models.Model):
    # خيارات حالة القراءة
    class ReadingStatus(models.TextChoices):
        READING = 'reading', 'قيد القراءة'
        FINISHED = 'finished', 'منتهي'
        FUTURE = 'future', 'نود القراءة في المستقبل'

    title = models.CharField(verbose_name="اسم الكتاب", max_length=255)
    author = models.CharField(verbose_name="اسم الكاتب", max_length=255)
    
    # حالة القراءة الافتراضية
    status = models.CharField(
        max_length=20,
        choices=ReadingStatus.choices,
        default=ReadingStatus.FUTURE
    )
    
    # التقييم من 1 لـ 5 نجوم
    rating = models.IntegerField(
        validators=[MinValueValidator(1), MaxValueValidator(5)],
        default=1
    )

    def __str__(self):
        return self.title