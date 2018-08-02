package js.node.mongodb;

import js.node.Buffer;
import js.node.mongodb.MongoCursor;
import js.node.mongodb.MongoDatabase;
import js.node.mongodb.MongoError;
import js.node.mongodb.MongoCollection;
import js.node.mongodb.MongoCollection.BulkWriteOpResult;
import js.node.mongodb.MongoCollection.WriteOpResult;
import js.node.mongodb.MongoGridStore;

/**
 * Typedefs for callbacks.
 */
typedef ResultCallback<T> = MongoError->T->Void;

typedef NoResultCallback = MongoError->Void;

typedef EndCallback = MongoError->Void;

typedef IteratorCallback<T> = T->Void;

typedef ToArrayResultCallback<T> = MongoError->Array<T>->Void;

typedef BulkWriteOpCallback = MongoError->BulkWriteOpResult->Void;

typedef CollectionResultCallback = MongoError->MongoCollection->Void;

typedef CollectionsResultCallback = MongoError->Array<MongoCollection>->Void;

typedef CountResultCallback = MongoError->Int->Void;

typedef ParallelCollectionScanCallback = MongoError->Array<MongoCursor>->Void;

typedef WriteOpCallback = MongoError->WriteOpResult->Void;

typedef OpenCallback<T> = MongoError->T->Void;

typedef GridStoreCallback = MongoError->MongoGridStore->Void;

typedef ReadCallback = MongoError->Buffer->Void;

typedef ReadLinesCallback = MongoError->Array<String>->Void;

typedef TellCallback = MongoError->Int;

typedef ConnectCallback = MongoError->MongoDatabase->Void;

