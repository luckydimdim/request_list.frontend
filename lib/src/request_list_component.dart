import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:html';
import 'package:resources_loader/resources_loader.dart';

import 'package:grid/grid.dart';

@Component(selector: 'request-list')
@View(
    templateUrl: 'request_list_component.html', directives: const [RouterLink])
class RequestListComponent implements OnInit, OnDestroy {
  static const String route_name = "RequestList";
  static const String route_path = "request-list";
  static const Route route = const Route(
      path: RequestListComponent.route_path,
      component: RequestListComponent,
      name: RequestListComponent.route_name);

  final Router _router;
  final ResourcesLoaderService _resourcesLoaderService;

  Grid _grid;

  RequestListComponent(this._router, this._resourcesLoaderService) {}

  void breadcrumbInit(){
    var  breadcrumbContent = querySelector('#breadcrumbContent') as HtmlElement;

    if (breadcrumbContent == null)
      return;

    breadcrumbContent.innerHtml = '''
            <li class="breadcrumb-item"><a href="#/master/dashboard">Главная</a></li>
            <li class="breadcrumb-item active">Список заявок</li>
    ''';
  }

  @override
  void ngOnInit() {

    breadcrumbInit();

/*    var columns = new List<Column>();
    columns.add(new Column(field: 'id', caption: '№', size: '150px'));
    columns.add(new Column(
        field: 'contractorName', caption: 'Подрядчик', size: '200px'));
    columns.add(new Column(
        field: 'creationDate',
        caption: 'Дата создания',
        render: 'date',
        size: '100px'));
    columns.add(new Column(
        field: 'correctionDate',
        caption: 'Дата изменения',
        render: 'date',
        size: '100px'));
    columns.add(new Column(
        field: 'contractNumber', caption: '№ договора', size: '200px'));
    columns.add(
        new Column(field: 'amount', caption: 'Сумма к оплате', size: '100px'));
    columns.add(new Column(field: 'status', caption: 'Статус', size: '100px'));

    GridOptions options = new GridOptions()
      ..name = 'grid'
      ..columns = columns
      ..url = '//cm-ylng-msk-01/cmas-backend/api/request/list'
      //..url = 'http://localhost:5000/api/request/list'
      ..method = 'GET';

    _grid = new Grid(this._resourcesLoaderService, "#grid", options);*/
  }

  @override
  void ngOnDestroy() {
   /* _grid.Destroy();*/
  }
}
