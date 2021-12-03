from unity_app.models import FlightReport


class FlightReportManager:
    def __init__(self):
        self.model = FlightReport

    def post(self, request):
        data = request.data
        user_guid = data.get("user_guid", "")
        max_speed = data.get("max_speed", "")
        danger_close = data.get("danger_close", "")
        hits = data.get("hits", "")
        loose_connection = data.get("loose_connection", "")
        max_height = data.get("max_height", "")
        time = data.get("time", "")
        status = data.get("status", "")
        points = data.get("points", "")

        instance = self.model.objects.create(user_id=user_guid, max_speed=max_speed, danger_close=danger_close,
                                             hits=hits, loose_connection=loose_connection,
                                             max_height=max_height, time=time, status=status, points=points)
        result = {
            "user_name": instance.user.name,
            "user_guid": instance.user.guid,
            "user_theory_result": instance.user.result,
            "max_speed": instance.max_speed,
            "loose_connection": instance.loose_connection,
            "danger_close": instance.danger_close,
            "hits": instance.hits,
            "max_height": instance.max_height,
            "time": instance.time,
            "status": instance.status,
            "points": instance.points,
        }
        return result

    def get_reports_by_user_guid(self, request):
        guid = request.query_params.get("user_guid")
        result = []
        instances = self.model.objects.filter(user_id=guid).all()
        for instance in instances:
            result.append({
                "report_guid": instance.guid,
                "user_name": instance.user.name,
                "user_guid": instance.user.guid,
                "user_theory_result": instance.user.result,
                "loose_connection": instance.loose_connection,
                "max_speed": instance.max_speed,
                "danger_close": instance.danger_close,
                "hits": instance.hits,
                "max_height": instance.max_height,
                "time": instance.time,
                "status": instance.status,
                "points": instance.points,
            })
        return result

    def get_all_reports(self):
        queryset = self.model.objects.all()
        return queryset

    def get_last_report_by_user_guid(self, request):
        guid = request.query_params.get("user_guid")
        instance = self.model.objects.filter(user_id=guid).last()
        result = {
            "report_guid": instance.guid,
            "user_name": instance.user.name,
            "user_guid": instance.user.guid,
            "user_theory_result": instance.user.result,
            "max_speed": instance.max_speed,
            "loose_connection": instance.loose_connection,
            "danger_close": instance.danger_close,
            "hits": instance.hits,
            "max_height": instance.max_height,
            "time": instance.time,
            "status": instance.status,
            "points": instance.points,
        }
        return result
