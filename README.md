# JMeter ElasticSearchBackendListenerClient Plugin

## Compatibility

### JMeter

- (tested 24.10.2018) JMeter 5.0.0
- Smartmeter 1.3.0-SNAPSHOT-161122-1811

### Elasticsearch

- (tested 24.10.2018) Elasticsearch 6.x

## Install

1.  copy `install.sh` to `path-to-apache-jmeter/lib`
2.  run `./install.sh`

## How to use

![Smartmeter](https://raw.githubusercontent.com/test-stack/smartmeter/develop/docs/elasticSearchBackendListener.png)

- `elasticsearchCluster` is target instance of Elasticsearch
- `indexName` and `sampleType` only for experts
- `runId` is ID of unique run
- `release`, `testPlanName` and `flag` is a searchable labels
- `verbose` options `always|ifError|never` logs of requests and response

For view of real-time performance test metrics, you cau use [Elasticsearch](https://www.elastic.co/) and [Kibana](https://www.elastic.co/products/kibana) or [Grafana](http://grafana.org/).

## Setup Elasticsearch

Create `smartmeterv2` template

```
PUT _template/smartmeter
{
  "index_patterns": ["smartmeter-*"],
  "settings": {
    "number_of_shards": 2,
    "number_of_replicas" : 1,
    "index.translog.durability": "async",
    "index.refresh_interval": "30s"
  },
  "mappings": {
    "smartmeter": {
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
  						"type": "keyword",
  				    "index": false
  					},
  					"Name": {
  						"type": "keyword",
  				    "index": false
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
  				"type": "keyword",
  				"index": false
  			},
  			"DataEncoding": {
  				"type": "keyword",
  				"index": false
  			},
  			"DataType": {
  				"type": "keyword",
  				"index": false
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
  				"type": "text",
  				"index": false
  			},
  			"ResponseCode": {
  				"type": "keyword"
  			},
  			"ResponseData": {
  				"type": "text",
  				"fields": {
  					"raw": {
  						"type": "keyword"
  					}
  				}
  			},
  			"ResponseMessage": {
  				"type": "text",
  				"fields": {
  					"raw": {
  						"type": "keyword"
  					}
  				}
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
  				"type": "boolean"
  			},
  			"ThreadName": {
  				"type": "keyword",
  				"index": false
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
  				"type": "keyword"
  			}
  		}
    }
	}
}
```

Check Kibana
![Kibana](https://raw.githubusercontent.com/test-stack/smartmeter/master/docs/kibana.png)

**Congratulations, let's run performance tests** | Less code more tests
