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
class SynchSalesDetailListener
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
        $this->salesRepository->updateDetailSalesOrder($event->sales->id); 
    }
}
