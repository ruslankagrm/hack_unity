import openpyxl
from django.http import HttpResponse
from openpyxl.styles import Font, Alignment
from openpyxl.writer.excel import save_virtual_workbook

title_font = Font(
    name='Times New Roman',
    size=12,
    bold=True,
)
text_font = Font(name='Times New Roman',
                 size=12)
text_alignment = Alignment(
    horizontal='center',
    vertical='center',
    wrapText=True
)
title_alignment = Alignment(
    horizontal='center',
    vertical='center',
)


class PDFManager:
    def __init__(self, input_data):
        self.input_data = input_data
        self.work_book = openpyxl.Workbook()
        self.work_sheet = self.work_book.active

    def get_document(self):
        self._create_title_rows()
        self._create_data_rows()
        self.work_book.save("wb")
        self._save_to_response()

    def _save_to_response(self):
        response = HttpResponse(content=save_virtual_workbook(self.work_book),
                                content_type='application/ms-excel',
                                status=201)
        response['Content-Disposition'] = f'attachment; filename=file.xls'
        return response

    def _create_title_rows(self):
        first_row = self.work_sheet['A1']
        first_row.font = title_font
        first_row.alignment = title_alignment
        first_row.value = "Имя пользователя"

        second_row = self.work_sheet['A2']
        second_row.font = title_font
        second_row.alignment = title_alignment
        second_row.value = "Результат"

    def _create_data_rows(self):
        counter = 2
        for element in self.input_data:
            self.work_sheet.cell[f"A{counter}"] = element.key()
            self.work_sheet.cell[f"B{counter}"] = element.value()
            counter += 1

