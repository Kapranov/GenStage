# Gencounter

```
iex> {:ok, producer} = GenStage.start_link(Gencounter.Producer, 0)
iex> {:ok, producer_consumer} = GenStage.start_link(Gencounter.ProducerConsumer, 2)
iex> {:ok, consumer} = GenStage.start_link(Gencounter.Consumer, :state)

iex> GenStage.sync_subscribe(producer_consumer, to: producer)
iex> GenStage.sync_subscribe(consumer, to: producer_consumer)
iex> Process.sleep(:infinity)
```

### 15 Feb 2021 by Oleg G.Kapranov
