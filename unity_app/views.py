from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from openpyxl.writer.excel import save_virtual_workbook
from rest_framework.parsers import MultiPartParser
from rest_framework.views import APIView, Response

from unity_app.managers.flight_report_manager import FlightReportManager
from unity_app.managers.pdf_manager import PDFManager
from unity_app.managers.questions_manager import QuestionManager
from unity_app.managers.results_manager import ResultManager
from unity_app.managers.tests_manager import TestsManager
from unity_app.managers.user_manager import UserManager
from unity_app.managers.variant_manager import VariantManager


class UserView(APIView):

    def get(self, request, guid):
        data = UserManager().get(guid=guid)
        return Response(status=200, data=data)

    def post(self, request):
        data = request.data
        if data:
            name = data.get("name")
        result_data = UserManager().post(name=name)
        return Response(status=201, data=result_data)

    def patch(self, request, guid):
        data = request.data
        if data:
            result_data = UserManager().patch(data=data)
            return Response(status=201, data=result_data)

    def delete(self, request, guid):
        data = request.data
        if data:
            guid = data.get("guid")
        result_data = UserManager().delete(guid=guid)
        if result_data:
            return Response(status=200)
        else:
            Response(status=204, data="No such user")


class AllUsersView(APIView):
    def get(self, request):
        result = []
        users = UserManager().model.objects.all()
        for user in users:
            result.append(FlightReportManager().get_reports_by_user(user_guid=user.guid))
        return Response(status=200, data=result)


class TestsView(APIView):
    def get(self, request):
        result = TestsManager().get(request=request)
        return Response(status=200, data=result)

    def delete(self, request):
        guid = request.get("guid")
        TestsManager().delete(guid=guid)
        return Response(status=200)


class TestsDetailedView(APIView):
    def get(self, request, guid):
        result = TestsManager().get_detailed(guid=guid)
        return Response(status=200, data=result)

    # ?????????????????? ???????????? ???? ??????????????
    # ?? ???????????? ?????????????? ????????
    def post(self, request, guid):
        data = request.data
        answers_chosen = data.get("answers")
        user_id = data.get("user")
        # ?????? ???????????? ???????? ansewers id = variant_id
        result = VariantManager().check(answers_ids=answers_chosen)
        user = UserManager().update_result(guid=user_id, result=result)
        response_data = {"user": user.guid,
                         "name": user.name,
                         "result": user.result}
        return Response(status=200, data=response_data)


class ResultsView(APIView):
    def get(self, request):
        result = ResultManager().get()
        return Response(status=200, data=result)


class FlightReportView(APIView):
    def get(self, request):
        if request.query_params.get("all"):
            result = FlightReportManager().get_reports_by_user_guid(request)
            return Response(status=200, data=result)
        if request.query_params.get("last"):
            result = FlightReportManager().get_last_report_by_user_guid(request)
            return Response(status=200, data=result)

    def post(self, request):
        result = FlightReportManager().post(request=request)
        return Response(status=200, data=result)


class RatingView(APIView):
    def get(self):
        users = UserManager().model.objects.order_by("result").all()
        result = []
        for user in users:
            result.append({user.name: user.result})
        return Response(status=200, data=result)


class RatingPDFView(APIView):
    # parser_classes = [MultiPartParser]

    def get(self, request):
        users = UserManager().model.objects.order_by("result").all()
        input_data = []
        for user in users:
            input_data.append({user.name: user.result})
        wb = PDFManager(input_data).get_document()
        response = HttpResponse(content=save_virtual_workbook(wb),
                                content_type='application/ms-excel',
                                status=201)
        response['Content-Disposition'] = f'attachment; filename=file.xls'
        return response
