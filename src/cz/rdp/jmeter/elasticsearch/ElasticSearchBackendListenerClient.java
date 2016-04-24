package cz.rdp.jmeter.elasticsearch;

import org.apache.jmeter.assertions.AssertionResult;
import org.apache.jmeter.config.Arguments;
import org.apache.jmeter.samplers.SampleResult;
import org.apache.jmeter.visualizers.backend.AbstractBackendListenerClient;
import org.apache.jmeter.visualizers.backend.BackendListenerContext;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ElasticSearchBackendListenerClient extends
        AbstractBackendListenerClient {
    private Client client;
    private String indexName;
    private String dateTimeAppendFormat;
    private String sampleType;
    private String runId;
    private long offset;
    private static final int DEFAULT_ELASTICSEARCH_PORT = 9300;
    private static final String TIMESTAMP = "timestamp";
    private static final String VAR_DELIMITER = "~";
    private static final String VALUE_DELIMITER = "=";
    @Override
    public void handleSampleResults(List<SampleResult> results,
                                    BackendListenerContext context) {
        String indexNameToUse = indexName;
        for(SampleResult result : results) {
            Map<String,Object> jsonObject = getMap(result);
            if(dateTimeAppendFormat != null) {
                SimpleDateFormat sdf = new SimpleDateFormat(dateTimeAppendFormat);
                indexNameToUse = indexName + sdf.format(jsonObject.get(TIMESTAMP));
            }
            client.prepareIndex(indexNameToUse, sampleType).setSource(jsonObject).execute().actionGet();
        }

    }

    private Map<String, Object> getMap(SampleResult result) {
        Map<String, Object> map = new HashMap<String, Object>();
        String[] sampleLabels = result.getSampleLabel().split(VAR_DELIMITER);
        map.put("SampleLabel", sampleLabels[0]);
        for(int i=1;i<sampleLabels.length;i++) {
            String[] varNameAndValue =sampleLabels[i].split(VALUE_DELIMITER);
            map.put(varNameAndValue[0], varNameAndValue[1]);
        }

        map.put("ResponseTime", result.getTime());
        map.put("ElapsedTime", result.getTime());
        map.put("ResponseCode", result.getResponseCode());
        map.put("ResponseMessage", result.getResponseMessage());
        map.put("ThreadName", result.getThreadName());
        map.put("DataType", result.getDataType());
        map.put("Success", String.valueOf(result.isSuccessful()));
        //map.put("FailureMessage", result.get);
        map.put("GrpThreads", result.getGroupThreads());
        map.put("AllThreads", result.getAllThreads());
        map.put("URL", result.getUrlAsString());
        map.put("Latency", result.getLatency());
        map.put("ConnectTime", result.getConnectTime());
        map.put("SampleCount", result.getSampleCount());
        map.put("ErrorCount", result.getErrorCount());
        map.put("Bytes", result.getBytes());
        map.put("BodySize", result.getBodySize());
        map.put("ContentType", result.getContentType());
        //map.put("HostName", result.get);
        map.put("IdleTime", result.getIdleTime());
        map.put(TIMESTAMP, new Date(result.getTimeStamp()));
        map.put("NormalizedTimestamp", new Date(result.getTimeStamp() - offset));
        map.put("StartTime", new Date(result.getStartTime()));
        map.put("EndTime", new Date(result.getEndTime()));
        map.put("RunId", runId);
        //TODO assertion results

        AssertionResult[] assertions = result.getAssertionResults();
        int count=0;
        if(assertions != null) {
            Map<String,Object> [] assertionArray = new HashMap[assertions.length];
            for(AssertionResult assertionResult : assertions) {
                Map<String,Object> assertionMap = new HashMap<String,Object>();
                assertionMap.put("Failure", assertionResult.isError() || assertionResult.isFailure());
                assertionMap.put("FailureMessage", assertionResult.getFailureMessage());
                assertionMap.put("Name", assertionResult.getName());
                assertionArray[count++] = assertionMap;
            }
            map.put("Assertions", assertionArray);
        }
        return map;
    }

    @Override
    public void setupTest(BackendListenerContext context) throws Exception {
        // TODO Auto-generated method stub
        String elasticsearchCluster = context.getParameter("elasticsearchCluster");

        String[] servers = elasticsearchCluster.split(",");

        indexName = context.getParameter("indexName");
        dateTimeAppendFormat=context.getParameter("dateTimeAppendFormat");
        if(dateTimeAppendFormat!=null && dateTimeAppendFormat.trim().equals("")) {
            dateTimeAppendFormat = null;
        }
        sampleType = context.getParameter("sampleType");
        client = new TransportClient();
        for(String serverPort: servers) {
            String[] serverAndPort = serverPort.split(":");
            int port = DEFAULT_ELASTICSEARCH_PORT;
            if(serverAndPort.length == 2) {
                port = Integer.parseInt(serverAndPort[1]);
            }
            ((TransportClient)client).addTransportAddress(new InetSocketTransportAddress(serverAndPort[0], port));
        }
        String normalizedTime = context.getParameter("normalizedTime");
        if(normalizedTime != null && normalizedTime.trim().length() > 0 ){
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSX");
            Date d = sdf2.parse(normalizedTime);
            long normalizedDate = d.getTime();
            Date now = new Date();
            offset = now.getTime() - normalizedDate;
        }
        runId = context.getParameter("runId");
        super.setupTest(context);
    }

    @Override
    public Arguments getDefaultParameters() {
        Arguments arguments = new Arguments();
        arguments.addArgument("elasticsearchCluster", "localhost:" + DEFAULT_ELASTICSEARCH_PORT);
        arguments.addArgument("indexName", "jmeter-elasticsearch");
        arguments.addArgument("sampleType", "SampleResult");
        arguments.addArgument("dateTimeAppendFormat", "-yyyy-MM-DD");
        arguments.addArgument("normalizedTime","2015-01-01 00:00:00.000-00:00");
        arguments.addArgument("runId", "${__UUID()}");
        //arguments.addArgument("summaryOnly", "true");
        //arguments.addArgument("samplersList", "");
        return arguments;


    }

    @Override
    public void teardownTest(BackendListenerContext context) throws Exception {
        client.close();
        super.teardownTest(context);
    }

}