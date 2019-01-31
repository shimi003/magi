from django.shortcuts import render
from django.http import HttpResponse
import random

# Create your views here.
def index(request):
    l = [
        'サピエンス全史（読書）',
        '財務会計講義（読書）',
        'ジョギング',
        'トランジスタ技術（読書）',
        '掃除',
        '電子工学実験',
        '筋トレ',
        'TAS動画',
        'Amazonプライムビデオ',
        '音楽鑑賞',
        '買い物（趣味のもの）',
    ]
    return HttpResponse("あなたが次にすべきなのは 「" + l[random.randrange(0, len(l), 1)] + "」 です！")
