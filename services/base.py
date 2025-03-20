from models.models import *
from django.shortcuts import get_object_or_404
from django.contrib import messages


class BaseServices:
    def __init__(self, request):
        self.request = request
