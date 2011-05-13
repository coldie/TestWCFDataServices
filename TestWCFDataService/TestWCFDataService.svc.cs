using System;
using System.Collections.Generic;
using System.Data.Services;
using System.Data.Services.Common;
using System.Linq;
using System.ServiceModel.Web;
using System.Web;

namespace TestWCFDataService
{
    public class TestWCFDataService : DataService<TestModel.TestModelContainer>
    {
        // This method is called only once to initialize service-wide policies.
        public static void InitializeService(DataServiceConfiguration config)
        {
            config.SetEntitySetAccessRule("Ladies", EntitySetRights.AllRead);
            config.SetEntitySetAccessRule("Gentlemen", EntitySetRights.AllRead);
            config.SetEntitySetAccessRule("Towns", EntitySetRights.AllRead);
            
            config.SetEntitySetPageSize("Ladies", 10);
            config.SetEntitySetPageSize("Gentlemen", 10);
            config.SetEntitySetPageSize("Towns", 10);

            config.DataServiceBehavior.MaxProtocolVersion = DataServiceProtocolVersion.V2;
        }
    }
}
