
from unity_app.models import Questions, Results


class ResultManager:
    def __init__(self):
        self.model = Results

    def get(self):
        queryset = self.model.objects.all()
        if queryset:
            return queryset.data

    def post(self):
        pass

    def patch(self):
        pass

    def delete(self):
        pass
