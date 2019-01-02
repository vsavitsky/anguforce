trigger MyTrigger on Book__c (before insert) {

    
    if (Trigger.isBefore) {

        Map<String, List<Book__c>> booksMap = new Map<String, List<Book__c>>(); // Master_Title__c , List-Book__c

        for (Book__c book : Trigger.new) {

            if (!booksMap.containsKey(book.Master_Title__c)) {

                booksMap.put(book.Master_Title__c, new List<Book__c>());                  
            }

            booksMap.get(book.Master_Title__c).add(book);
        }

        List<Book__c> relatedBooks = [SELECT Id, Title__c, Master_Title__c, Language__c, Master_Record__c
                                        FROM Book__c
                                        WHERE Master_Title__c IN :booksMap.keySet()];

        for (Book__c book : relatedBooks) {

            if (book.Language__c == 'en_US') {

                for (Book__c bookFromMap : booksMap.get(book.Master_Title__c)) {

                    bookFromMap.Master_Record__c = book.Id;
                }

            } else {

                for (Book__c bookFromMap : booksMap.get(book.Master_Title__c)) {

                    if (bookFromMap.Language__c == 'en_US') {

                        book.Master_Record__c = bookFromMap.Id;
                    }
                }
            }
        }

        update relatedBooks;
    }

}