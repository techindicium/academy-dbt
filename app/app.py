from dash import Dash, Input, Output, dcc, html, dash_table
import webbrowser
from threading import Timer

app = Dash('monitoring-analysis')

def updated_layout():
    layout = None
    return layout

app.layout = updated_layout

def open_browser():
    webbrowser.open_new("http://localhost:8050")

if __name__ == '__main__':
    Timer(1, open_browser())
    app.run_server()