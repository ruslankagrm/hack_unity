from unity_app.models import Questions, Variants


class VariantManager:
    def __init__(self):
        self.model = Variants

    def get_all_by_question_id(self, question_id):
        variants = self.model.objects.filter(question_id=question_id)
        return variants.data

    def get_all(self):
        variants = self.model.objects.all()
        return variants.data

    def check(self, answers_ids):
        # 4 вопроса по 4 варика
        result = int()
        variants = self.get_all()
        counter = 0
        for element in variants:
            if element in answers_ids:
                counter += 1
        result = counter * 0.25
        return result

    def post(self):
        pass

    def patch(self):
        pass

    def delete(self):
        pass
