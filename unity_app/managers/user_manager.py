from unity_app.models import Questions, Results, ProjectUser


class UserManager:
    def __init__(self):
        self.model = ProjectUser

    def get(self, guid):
        if guid:
            instance = self.model.objects.get(guid=guid)
            result = {"guid": instance.guid,
                      "name": instance.name,
                      "result": instance.result}
            return result

    def post(self, name):
        result = {"guid": None,
                  "name": None}
        if self.model.objects.filter(name=name).first():
            instance = self.model.objects.get(name=name)
            result["guid"] = instance.guid
            result["name"] = instance.name
            return result
        instance = self.model.objects.create(name=name)
        result["guid"] = instance.guid
        result["name"] = instance.name
        return result

    def patch(self, data):
        instance = self.model.objects.get(guid=data.get("guid"))
        name = data.get("name")
        uid = data.get("uid")
        result = data.get("result")

        if name:
            instance.name = name

        if uid:
            instance.uid = uid

        if result:
            instance.result = result
        instance.save()
        result = {"name": instance.name,
                  "guid": instance.name,
                  "result": instance.result}
        return result

    def delete(self, guid):
        try:
            instance = self.model.objects.delete(guid=guid)
            return True
        except Exception as ex:
            print(ex)
            return False

    def update_result(self, guid, result):
        instance = self.model.objects.get(guid=guid)
        instance.result = result
        instance.save()
        Results.objects.create(user_id=guid, result=instance.result)
        return instance
