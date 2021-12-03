from unity_app.managers.variant_manager import VariantManager
from unity_app.models import Questions


class QuestionManager:
    def __init__(self):
        self.model = Questions

    def get(self, task_id):
        result_dict = list()
        questions_queryset = self.model.objects.filter(test_id_id=task_id).all()
        answers = []
        for question in questions_queryset:
            questions = VariantManager().get_all_by_question_id(question_id=question.guid)
            answers.append(questions)
            result_dict.append({question.guid: questions,
                                "question_name": question.name})
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
