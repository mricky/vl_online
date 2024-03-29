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
use \stdClass;
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
             $id = $event->sales->id;
             $this->salesRepository->updateDeliveryOrder($id);
             $this->productRepository->updateSalesStokLocation($event->sales->id);
     
    }
}
