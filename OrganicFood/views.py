from django.shortcuts import render
from recommendation.strategy_context import StrategyContext


def home(request):
    recommend_context = StrategyContext(request.user)
    context = recommend_context.get_top_data()
    context['product_list'] = recommend_context.get_recommended_product_list()
    return render(request, 'home.html', context)


def contact(request):
    return render(request, 'contact.html')

