<mxfile host="app.diagrams.net">
  <diagram id="ticket-classifier-architecture" name="Arquitectura objetivo">
    <mxGraphModel dx="1200" dy="1000" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1180" pageHeight="1280" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />

        <!-- Title -->
        <mxCell id="title" value="&lt;b&gt;Ticket Classifier AI: arquitectura objetivo&lt;/b&gt;" style="text;html=1;align=left;verticalAlign=middle;fontSize=18;" vertex="1" parent="1">
          <mxGeometry x="40" y="0" width="520" height="30" as="geometry" />
        </mxCell>

        <!-- Legend -->
        <mxCell id="legend_title" value="&lt;b&gt;Estado&lt;/b&gt;" style="text;html=1;align=left;verticalAlign=middle;" vertex="1" parent="1">
          <mxGeometry x="900" y="20" width="200" height="24" as="geometry" />
        </mxCell>
        <mxCell id="legend_done" value="Existe" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
          <mxGeometry x="900" y="48" width="200" height="34" as="geometry" />
        </mxCell>
        <mxCell id="legend_partial" value="Empezado o por corregir" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
          <mxGeometry x="900" y="90" width="200" height="34" as="geometry" />
        </mxCell>
        <mxCell id="legend_pending" value="Pendiente" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;dashed=1;" vertex="1" parent="1">
          <mxGeometry x="900" y="132" width="200" height="34" as="geometry" />
        </mxCell>
        <mxCell id="legend_external" value="Servicio externo" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e1d5e7;strokeColor=#9673a6;" vertex="1" parent="1">
          <mxGeometry x="900" y="174" width="200" height="34" as="geometry" />
        </mxCell>

        <!-- Entry points -->
        <mxCell id="client" value="Cliente HTTP / webhook" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
          <mxGeometry x="280" y="40" width="200" height="60" as="geometry" />
        </mxCell>
        <mxCell id="csv_in" value="tickets.csv" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
          <mxGeometry x="620" y="40" width="200" height="60" as="geometry" />
        </mxCell>
        <mxCell id="api" value="&lt;b&gt;app.py&lt;/b&gt;&lt;br&gt;FastAPI: POST /classify" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
          <mxGeometry x="280" y="140" width="200" height="60" as="geometry" />
        </mxCell>
        <mxCell id="batch" value="&lt;b&gt;main.py&lt;/b&gt;&lt;br&gt;Procesamiento por lotes" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
          <mxGeometry x="620" y="140" width="200" height="60" as="geometry" />
        </mxCell>

        <!-- Input validation -->
        <mxCell id="validate" value="¿Ticket válido?&lt;br&gt;(más de 5 caracteres)" style="rhombus;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;dashed=1;" vertex="1" parent="1">
          <mxGeometry x="280" y="240" width="200" height="90" as="geometry" />
        </mxCell>
        <mxCell id="error" value="Error 422" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;dashed=1;" vertex="1" parent="1">
          <mxGeometry x="40" y="255" width="160" height="60" as="geometry" />
        </mxCell>

        <!-- Orchestration -->
        <mxCell id="service" value="&lt;b&gt;services/ticket_service.py&lt;/b&gt;&lt;br&gt;process_ticket()" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;dashed=1;" vertex="1" parent="1">
          <mxGeometry x="400" y="380" width="240" height="60" as="geometry" />
        </mxCell>

        <!-- Priority: business rules -->
        <mxCell id="rules" value="&lt;b&gt;services/priority_rules.py&lt;/b&gt;&lt;br&gt;Prioridad por reglas de negocio" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
          <mxGeometry x="120" y="500" width="240" height="70" as="geometry" />
        </mxCell>

        <!-- Category and summary: LLM -->
        <mxCell id="classifier" value="&lt;b&gt;services/classifier.py&lt;/b&gt;&lt;br&gt;Categoría, resumen y revisión" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
          <mxGeometry x="560" y="500" width="240" height="70" as="geometry" />
        </mxCell>
        <mxCell id="groq" value="&lt;b&gt;Groq API&lt;/b&gt;&lt;br&gt;Modelo LLM" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e1d5e7;strokeColor=#9673a6;" vertex="1" parent="1">
          <mxGeometry x="900" y="500" width="200" height="70" as="geometry" />
        </mxCell>
        <mxCell id="schema" value="¿JSON y esquema&lt;br&gt;válidos?" style="rhombus;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;dashed=1;" vertex="1" parent="1">
          <mxGeometry x="570" y="620" width="220" height="100" as="geometry" />
        </mxCell>
        <mxCell id="fallback" value="&lt;b&gt;Fallback&lt;/b&gt;&lt;br&gt;OTHER, needs_review: true" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
          <mxGeometry x="900" y="640" width="200" height="60" as="geometry" />
        </mxCell>

        <!-- Result and human review -->
        <mxCell id="result" value="&lt;b&gt;Resultado combinado&lt;/b&gt;&lt;br&gt;type, priority, summary, needs_review" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;dashed=1;" vertex="1" parent="1">
          <mxGeometry x="380" y="770" width="280" height="70" as="geometry" />
        </mxCell>
        <mxCell id="review" value="¿needs_review?" style="rhombus;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;dashed=1;" vertex="1" parent="1">
          <mxGeometry x="410" y="880" width="220" height="100" as="geometry" />
        </mxCell>
        <mxCell id="queue" value="&lt;b&gt;Cola de revisión humana&lt;/b&gt;&lt;br&gt;Incluye review_reason" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;dashed=1;" vertex="1" parent="1">
          <mxGeometry x="100" y="900" width="220" height="60" as="geometry" />
        </mxCell>

        <!-- Persistence -->
        <mxCell id="sqlite" value="&lt;b&gt;SQLite&lt;/b&gt;&lt;br&gt;Resultado y timestamp" style="shape=cylinder3;whiteSpace=wrap;html=1;boundedLbl=1;backgroundOutline=1;size=12;fillColor=#dae8fc;strokeColor=#6c8ebf;dashed=1;" vertex="1" parent="1">
          <mxGeometry x="400" y="1030" width="240" height="80" as="geometry" />
        </mxCell>

        <!-- Outputs -->
        <mxCell id="response" value="Respuesta JSON" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
          <mxGeometry x="280" y="1170" width="200" height="60" as="geometry" />
        </mxCell>
        <mxCell id="csv_out" value="results.csv" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
          <mxGeometry x="560" y="1170" width="200" height="60" as="geometry" />
        </mxCell>

        <!-- Edges -->
        <mxCell id="e_client_api" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;" edge="1" parent="1" source="client" target="api">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_csv_batch" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;" edge="1" parent="1" source="csv_in" target="batch">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_api_validate" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;" edge="1" parent="1" source="api" target="validate">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_validate_error" value="No" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=1;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="validate" target="error">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_validate_service" value="Sí" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="validate" target="service">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_batch_service" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=1;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="batch" target="service">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_service_rules" value="1" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.25;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="service" target="rules">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_service_classifier" value="2" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.75;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="service" target="classifier">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_classifier_groq" value="HTTP" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;startArrow=classic;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="classifier" target="groq">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_classifier_schema" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;" edge="1" parent="1" source="classifier" target="schema">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_schema_fallback" value="No" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="schema" target="fallback">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_schema_result" value="Sí" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.75;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="schema" target="result">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_fallback_result" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=1;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="fallback" target="result">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_rules_result" value="priority" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="rules" target="result">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_result_review" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;" edge="1" parent="1" source="result" target="review">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_review_queue" value="Sí" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=1;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="review" target="queue">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_review_sqlite" value="No" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="review" target="sqlite">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_queue_sqlite" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="queue" target="sqlite">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_sqlite_response" value="API" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.25;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="sqlite" target="response">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e_sqlite_csv" value="Lote" style="edgeStyle=orthogonalEdgeStyle;rounded=0;html=1;exitX=0.75;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="sqlite" target="csv_out">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
