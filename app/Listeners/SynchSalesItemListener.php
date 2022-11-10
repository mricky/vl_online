<?php

namespace App\Listeners;

use App\Events\OrderEntryEvent;
use App\Events\SalesEntryEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Repositories\{
    SalesOrderRepository,
    ProductRepository
};
class SynchSalesItemListener
{
   
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct(SalesOrderRepository $salesRepository,ProductRepository $productRepository)
    {
        $this->salesRepository = $salesRepository;
        $this->productRepository = $productRepository;
    }

    /**
     * Handle the event.
     *
     * @param  Event  $event
     * @return void
     */
    public function handle(SalesEntryEvent $event)
    {
       # var_dump($event->sales->id); exit;
        
        $payload = [
            'id' => $event->sales->id,
            'delivery_order' => 1
        ];
       #var_dump($payload);
        $this->salesRepository->updateDeliveryOrder((object)$payload);
        $this->productRepository->updateSalesStokLocation($event->sales->id);
        // Sync
    }
}
