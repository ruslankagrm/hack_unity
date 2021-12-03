from unity_app.managers.variant_manager import VariantManager
from unity_app.models import Questions


class QuestionManager:
    def __init__(self):
        self.model = Questions

    def get(self, task_id):
        result_dict = list()
        questions_queryset = self.model.objects.filter(test_id_id=task_id).all()
        for question in questions_queryset:
            result_dict.append({question.name: VariantManager().get_all_by_question_id(question_id=question.guid)})
        return result_dict

    def get_detailed(self, guid):
        instance = self.model.objects.get(guid=guid)
        return instance

    def post(self):
        pass

    def patch(self):
        pass

    def delete(self):
        pass
