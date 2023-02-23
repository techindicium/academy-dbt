from dash import Dash, Input, Output, dcc, html, dash_table
import webbrowser
from threading import Timer
from Services.DatavisService import DatavisService

app = Dash('monitoring-analysis')

colors = {
    'dark-bg-0': '#000000',
    'dark-bg': '#222222',
    'dark-bg-txt': '#DCDCDC'
}

datavisService = DatavisService()

def updated_layout():
    layout = html.Div(
                children=[
                    # dcc.Store(id='storage'),
                    html.H1(children='ACADEMY DBT JOHANN'),
                    html.Div(children=[
                            html.P(
                            f"Pedidos por produto",
                            style={'textAlign': 'left', 'fontSize': 'larger', 'fontWeight': 'bold'}),
                            dcc.Graph(
                                id='all-distributors-unknown-errors-count',
                                #figure=datavisService.make_graph(datavisService.data, 'Distribuidora', 'Contagem de Erros Desconhecidos', colors)
                            )
                        ],
                        style={'marginTop': '100px'}
                    )
                ],
                style={
                    'background-color': colors['dark-bg'], 
                    'color': colors['dark-bg-txt'], 
                    'textAlign': 'center',
                    'padding': '4%',
                    'height': '100%'
                })
    return layout

app.layout = updated_layout

def open_browser():
    webbrowser.open_new("http://localhost:8050")

if __name__ == '__main__':
    Timer(1, open_browser())
    app.run_server(debug=True)