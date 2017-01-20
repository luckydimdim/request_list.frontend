import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:resources_loader/resources_loader.dart';

import 'package:grid/grid.dart';

@Component(selector: 'request-list')
@View(
    templateUrl: 'request_list_component.html', directives: const [RouterLink])
class RequestListComponent implements OnInit {
  static const String route_name = "RequestList";
  static const String route_path = "requestList";
  static const Route route = const Route(
      path: RequestListComponent.route_path,
      component: RequestListComponent,
      name: RequestListComponent.route_name);

  final Router _router;
  final ResourcesLoaderService _resourcesLoaderService;

  RequestListComponent(this._router, this._resourcesLoaderService) {}

  @override
  void ngOnInit() {
    var model = new DataSourceSchemaModelWithFieldsArray();
    model.fields = new List<DataSourceSchemaModelField>();

    model.fields.add(
        new DataSourceSchemaModelField(field: "creationDate", type: "date"));
    model.fields.add(
        new DataSourceSchemaModelField(field: "correctionDate", type: "date"));

    var schema = new DataSourceSchema()..model = model;

    var transportRead = new DataSourceTransportRead()
      ..type = "get"
      ..dataType = "json"
      ..url = "//localhost:5000/api/request/list";

    var transport = new DataSourceTransport()..read = transportRead;

    var dataSource = new DataSource()
      ..type = "odata"
      ..schema = schema
      ..transport = transport;

    GridOptions options = new GridOptions()
      ..dataSource = dataSource
      ..columns = new List<GridColumn>()
      ..filterable = true
      //..height = 500
      ..sortable = true;

    options.columns.add(
        new GridColumn(field: "id", title: "№", width: 150, filterable: true));
    options.columns.add(new GridColumn(
        field: "contractorName", title: "Подрядчик", sortable: true));
    options.columns.add(new GridColumn(
        field: "creationDate",
        title: "Дата создания",
        sortable: true,
        format: "{0: dd/MM/yyyy}"));
    options.columns.add(new GridColumn(
        field: "correctionDate",
        title: "Дата изменения",
        sortable: true,
        format: "{0: dd/MM/yyyy}"));
    options.columns.add(new GridColumn(
        field: "contractNumber", title: "№ договора", sortable: true));
    options.columns.add(new GridColumn(
        field: "amount", title: "Сумма к оплате", sortable: true));
    options.columns
        .add(new GridColumn(field: "status", title: "Статус", sortable: true));

    new Grid(this._resourcesLoaderService, "#grid", options);
  }
}
