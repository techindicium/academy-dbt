from datetime import datetime
import json
import pandas as pd
import plotly.express as px
from pandas import DataFrame
from datetime import datetime

class DatavisService():
    def make_graph(self, data: DataFrame, x: str, y: str, style_dict: dict, orientation='v'):
        x = x.replace(' ', '')
        fig = px.bar(
            data[x].value_counts(), 
            color=data[x].value_counts().index,
            labels={'index': x, 'value': y, 'color': x}, orientation=orientation)
        fig.update_layout(
            plot_bgcolor=style_dict['dark-bg-0'],
            paper_bgcolor=style_dict['dark-bg-0'],
            font_color=style_dict['dark-bg-txt']
        )

        return fig