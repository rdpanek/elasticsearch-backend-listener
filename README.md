# SmartMeter ElasticSearchBackendListenerClient Plugin

## Compatibility

### SmartMeter

* (tested 31.12.2017) SmartMeter 1.6.0-SNAPSHOT-171204-1719_macos
* Smartmeter 1.3.0-SNAPSHOT-161122-1811

### Elasticsearch

* (tested 31.12.2017) Elasticsearch 5.x

## Install

1. copy `install.sh` to `path-to-Smarmeter/programs/apache-jmeter/lib`
2. run `./install.sh`
3. restart Smartmeter

## How to use

![Smartmeter](https://raw.githubusercontent.com/test-stack/smartmeter/develop/docs/elasticSearchBackendListener.png)

* `elasticsearchCluster` is target instance of Elasticsearch
* `indexName` and `sampleType` only for experts
* `runId` is ID of unique run
* `release`, `testPlanName` and `flag` is a searchable labels
* `verbose` options `always|ifError|never` logs of requests and response

For view of real-time performance test metrics, you cau use [Elasticsearch](https://www.elastic.co/) and [Kibana](https://www.elastic.co/products/kibana) or [Grafana](http://grafana.org/).

## Setup Elasticsearch

Create `smartmeterv2` template

```
# PUT http://xxx.xxx.xxx.xxx:9200/_template/smartmeterv2
{
	"smartmeterv2-*": {
		"mappings": {
			"smartmeterv2": {
				"dynamic": "strict",
				"properties": {
					"AllThreads": {
						"type": "long"
					},
					"Assertions": {
						"properties": {
							"Failure": {
								"type": "boolean"
							},
							"FailureMessage": {
								"type": "text"
							},
							"Name": {
								"type": "text"
							}
						}
					},
					"BodySize": {
						"type": "long"
					},
					"Bytes": {
						"type": "long"
					},
					"ConnectTime": {
						"type": "long"
					},
					"ContentType": {
						"type": "text"
					},
					"DataEncoding": {
						"type": "keyword",
						"index": false
					},
					"DataType": {
						"type": "text"
					},
					"ElapsedTime": {
						"type": "long"
					},
					"EndTime": {
						"type": "date",
						"format": "dateOptionalTime"
					},
					"ErrorCount": {
						"type": "long"
					},
					"GrpThreads": {
						"type": "long"
					},
					"IdleTime": {
						"type": "long"
					},
					"Latency": {
						"type": "long"
					},
					"NormalizedTimestamp": {
						"type": "date",
						"format": "dateOptionalTime"
					},
					"RequestHeaders": {
						"type": "text"
					},
					"ResponseCode": {
						"type": "keyword"
					},
					"ResponseData": {
						"type": "text",
						"index": false
					},
					"ResponseMessage": {
						"type": "text",
						"fields": {
							"raw": {
								"type": "keyword"
							}
						}
					},
					"ResponseTime": {
						"type": "long"
					},
					"RunId": {
						"type": "keyword"
					},
					"SampleCount": {
						"type": "long"
					},
					"SampleLabel": {
						"type": "keyword"
					},
					"SamplerData": {
						"type": "text"
					},
					"StartTime": {
						"type": "date",
						"format": "dateOptionalTime"
					},
					"SubResults": {
						"type": "text"
					},
					"Success": {
						"type": "keyword"
					},
					"ThreadName": {
						"type": "keyword"
					},
					"URL": {
						"type": "keyword"
					},
					"flag": {
						"type": "keyword"
					},
					"release": {
						"type": "keyword"
					},
					"testPlanName": {
						"type": "keyword"
					},
					"timestamp": {
						"type": "date",
						"format": "dateOptionalTime"
					},
					"verbose": {
						"type": "keyword",
						"index": false
					}
				}
			}
		}
	}
}
```

Check successfully template was added

```
# GET http://xxx.xxx.xxx.xxx:9200/_template

{
  "smartmeterv2": {
    "order": 0,
    "template": "smartmeterv2-*",
    "settings": {},
    "mappings": {
      "smartmeter": {
        "dynamic": "strict"
  ...
```

Check Kibana
![Kibana](https://raw.githubusercontent.com/test-stack/smartmeter/master/docs/kibana.png)

**Congratulations, let's run performance tests** | Less code more tests
