from unity_app.managers.questions_manager import QuestionManager
from unity_app.models import Tests


class TestsManager:
    def __init__(self):
        self.model = Tests

    def get(self, request):
        instance = self.model.objects.all()
        result = []
        for element in instance:
            result.append({"guid": element.guid,
                           "name": element.name, })
        return result

    def delete(self, guid):
        try:
            instance = self.model.objects.delete(guid=guid)
            return True
        except Exception as ex:
            print(ex)
            return False

    def get_detailed(self, guid):
        questions = QuestionManager().get(task_id=guid)
        return questions.data
